# bashrc or bash_profile

### GoLang ###
GO111MODULE=on
GOROOT=/usr/local/go
# for gomobile & protoc-gen-go
GOPATH=$HOME/go
# flutter
FLUTTER_PATH=$HOME/flutter/bin
# dart 
DART_HOMEPATH=$HOME/.pub-cache/bin
# java
JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
ANDROID_SDK=$HOME/.Android/sdk
ANDROID_HOME=$ANDROID_SDK
ANDROID_NDK=$ANDROID_SDK/ndk-bundle
ANDROID_PLATFORM_TOOLS=$ANDROID_SDK/platform-tools
ANDROID_TOOLS=$ANDROID_SDK/tools

export GOROOT GO111MODULE GOPATH JAVA_HOME ANDROID_HOME ANDROID_SDK ANDROID_NDK ANDROID_PLATFORM_TOOLS ANDROID_TOOLS
export PATH=$JAVA_HOME/bin:$DART_HOMEPATH:$GOPATH/bin:$FLUTTER_PATH:$GOROOT/bin:$PATH