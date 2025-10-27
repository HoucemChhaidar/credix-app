FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV FLUTTER_VERSION=3.16.0

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-11-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set up Java environment
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Install Android SDK
ENV ANDROID_SDK_ROOT=/opt/android-sdk
RUN mkdir -p $ANDROID_SDK_ROOT
RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip -O /tmp/cmdline-tools.zip
RUN unzip -q /tmp/cmdline-tools.zip -d $ANDROID_SDK_ROOT
RUN mv $ANDROID_SDK_ROOT/cmdline-tools $ANDROID_SDK_ROOT/cmdline-tools
RUN mkdir -p $ANDROID_SDK_ROOT/cmdline-tools/latest
RUN mv $ANDROID_SDK_ROOT/cmdline-tools/* $ANDROID_SDK_ROOT/cmdline-tools/latest/
RUN rm /tmp/cmdline-tools.zip

# Set up Android environment variables
ENV PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Accept Android licenses
RUN yes | sdkmanager --licenses

# Install Android platforms and build tools
RUN sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2"

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /opt/flutter -b $FLUTTER_VERSION --depth 1
ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:$PATH"

# Enable Flutter
RUN flutter doctor
RUN flutter precache

# Set up workspace
WORKDIR /app

# Copy project files
COPY . .

# Create a script to run builds
RUN chmod +x /opt/flutter/bin/flutter

CMD ["/bin/bash"]