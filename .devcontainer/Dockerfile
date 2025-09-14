FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl git unzip zip xz-utils \
      openjdk-17-jdk \
      ca-certificates wget pkg-config lsb-release gnupg \
      lib32z1 libbz2-1.0 \
      procps && \
    rm -rf /var/lib/apt/lists/*

ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV PATH="${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/platform-tools:${PATH}"

RUN mkdir -p "${ANDROID_SDK_ROOT}/cmdline-tools" && \
    wget -O /tmp/cmdtools.zip "https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip" && \
    unzip /tmp/cmdtools.zip -d "${ANDROID_SDK_ROOT}/cmdline-tools" && \
    mv "${ANDROID_SDK_ROOT}/cmdline-tools/cmdline-tools" "${ANDROID_SDK_ROOT}/cmdline-tools/latest" && \
    rm /tmp/cmdtools.zip

RUN yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" \
               "platforms;android-35" \
               "build-tools;35.0.0" \
               "ndk;28.2.13676358" \
               "cmake;4.1.1"

RUN useradd -m -s /bin/bash flutteruser && \
    mkdir -p /workspace && \
    chown -R flutteruser:flutteruser /workspace ${ANDROID_SDK_ROOT}

USER flutteruser
WORKDIR /workspace