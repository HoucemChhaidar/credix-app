pipeline {
    agent {
        docker {
            image 'your-username/flutter-android:latest'
            args '-u root:root'
        }
    }

    environment {
        SENTRY_DSN = credentials('sentry-dsn')
        SENTRY_AUTH_TOKEN = credentials('sentry-auth-token')
        ANDROID_KEYSTORE_PATH = credentials('android-keystore-path')
        ANDROID_KEYSTORE_ALIAS = credentials('android-keystore-alias')
        ANDROID_KEYSTORE_PRIVATE_KEY_PASSWORD = credentials('android-keystore-private-key-password')
        ANDROID_KEYSTORE_PASSWORD = credentials('android-keystore-password')
        GDRIVE_FOLDER_ID = credentials('gdrive-folder-id')
        GDRIVE_SERVICE_ACCOUNT_JSON = credentials('gdrive-service-account-json')
    }

    triggers {
        pollSCM('H/5 * * * *')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Setup Flutter') {
            steps {
                sh 'flutter --version'
                sh 'flutter doctor'
                sh 'flutter pub get'
            }
        }

        stage('Build APK') {
            steps {
                sh '''
                    flutter build apk --release \
                    --dart-define=SENTRY_DSN=$SENTRY_DSN
                '''
            }
        }

        stage('Upload to Google Drive') {
            steps {
                script {
                    def apkPath = "build/app/outputs/flutter-apk/app-release.apk"
                    def timestamp = new Date().format('yyyyMMdd_HHmmss')
                    def apkName = "credix-app-${timestamp}.apk"

                    // Install gdrive CLI or use Google APIs
                    withCredentials([file(credentialsId: 'gdrive-service-account', variable: 'GDRIVE_SA_FILE')]) {
                        sh """
                            pip install google-api-python-client oauth2client
                            python3 scripts/upload_to_gdrive.py \
                                --file "$apkPath" \
                                --name "$apkName" \
                                --folder "$GDRIVE_FOLDER_ID" \
                                --service-account "$GDRIVE_SA_FILE"
                        """
                    }
                }
            }
        }

        stage('Cleanup') {
            steps {
                sh 'flutter clean'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            slackSend(
                channel: '#builds',
                message: "Build Successful: ${env.JOB_NAME} ${env.BUILD_NUMBER} - APK uploaded to Google Drive"
            )
        }
        failure {
            slackSend(
                channel: '#builds',
                message: "Build Failed: ${env.JOB_NAME} ${env.BUILD_NUMBER}"
            )
        }
    }
}