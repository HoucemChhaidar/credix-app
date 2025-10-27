#!/usr/bin/env python3
import argparse
import json
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload
from oauth2client.service_account import ServiceAccountCredentials

def upload_to_gdrive(file_path, name, folder_id, service_account_file):
    """Upload file to Google Drive"""

    # Authenticate with service account
    credentials = ServiceAccountCredentials.from_json_keyfile_name(
        service_account_file,
        ['https://www.googleapis.com/auth/drive.file']
    )

    drive_service = build('drive', 'v3', credentials=credentials)

    file_metadata = {
        'name': name,
        'parents': [folder_id]
    }

    media = MediaFileUpload(file_path, resumable=True)

    file = drive_service.files().create(
        body=file_metadata,
        media_body=media,
        fields='id, webViewLink'
    ).execute()

    print(f"File uploaded successfully: {file.get('webViewLink')}")
    return file.get('webViewLink')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Upload APK to Google Drive')
    parser.add_argument('--file', required=True, help='Path to APK file')
    parser.add_argument('--name', required=True, help='Name for the uploaded file')
    parser.add_argument('--folder', required=True, help='Google Drive folder ID')
    parser.add_argument('--service-account', required=True, help='Service account JSON file')

    args = parser.parse_args()

    upload_to_gdrive(args.file, args.name, args.folder, args.service_account)