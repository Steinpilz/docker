FROM mcr.microsoft.com/dotnet/sdk:7.0

# JAVA
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# Install workload maui
RUN dotnet workload install maui-android --ignore-failed-sources

# Utils
RUN apt-get update && apt-get install -y \
    unzip && \
    rm -rf /var/lib/apt/lists/*

# Install Android SDK
RUN mkdir -p /usr/lib/android-sdk/cmdline-tools/latest && \
    curl -k "https://dl.google.com/android/repository/commandlinetools-linux-9123335_latest.zip" -o commandlinetools-linux.zip && \
    unzip -q commandlinetools-linux.zip -d /usr/lib/android-sdk/tmp && \
    mv  /usr/lib/android-sdk/tmp/cmdline-tools/* /usr/lib/android-sdk/cmdline-tools/latest && \
    rm -rf /usr/lib/android-sdk/tmp/ && \
    rm commandlinetools-linux.zip

ENV ANDROID_SDK_ROOT=/usr/lib/android-sdk
ENV PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH

RUN yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" && \
    sdkmanager "build-tools;33.0.0" "platforms;android-33"
