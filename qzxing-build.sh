


 QT_VERSION=6.5.0
 ANDROID_NDK="/home/muneer/.Installation/android-sdk-linux/ndk/27.2.12479018"


 rm -rf build
 rm -rf libs

OS=$(uname)

if [ $OS == "Linux"  ]; then
    # Linux x64
    mkdir -p build/linux-x64 && cd build/linux-x64 && \
    ~/.Installation/Qt/$QT_VERSION/gcc_64/bin/qmake ../../qzxing.pro "CONFIG+=release" && \
    make
    cd ../../
    mkdir -p libs/linux-x64 && cp build/linux-x64/libQZXing.a libs/linux-x64/libQZXing.a


    # Android
    export ANDROID_NDK_ROOT=$ANDROID_NDK

    # Android arm64
    mkdir -p build/android-arm64 && cd build/android-arm64 && \
    ~/.Installation/Qt/$QT_VERSION/android_arm64_v8a/bin/qmake ../../qzxing.pro "CONFIG+=release" && \
    make
    cd ../../
    mkdir -p libs/android-arm64 && cp build/android-arm64/libQZXing_arm64-v8a.so libs/android-arm64/libQZXing_arm64-v8a.so

    # Android arm
    mkdir -p build/android-arm && cd build/android-arm && \
    ~/.Installation/Qt/$QT_VERSION/android_armv7/bin/qmake ../../qzxing.pro "CONFIG+=release" && \
    make
    cd ../../
    mkdir -p libs/android-arm && cp build/android-arm/libQZXing_armeabi-v7a.so libs/android-arm/libQZXing_armeabi-v7a.so
fi

if [ $OS == "Darwin" ]; then
    # Mac
    mkdir -p build/macos && cd build/macos && \
    ~/Qt/$QT_VERSION/macos/bin/qmake ../../qzxing.pro "CONFIG+=release" && \
    make
    cd ../../
    mkdir -p libs/macos && cp build/macos/libQZXing.a libs/macos/libQZXing.a

    # iOS
    mkdir -p build/ios && cd build/ios && \
    ~/Qt/$QT_VERSION/ios/bin/qmake ../../qzxing.pro "CONFIG+=release" && \
    make
    cd ../../
    mkdir -p libs/ios && cp build/ios/libQZXing.a libs/ios/libQZXing.a

fi
