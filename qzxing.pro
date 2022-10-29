# TEMPLATE = subdirs
# SUBDIRS =


DEFINES += QZXING_QML=1

android: {  # MUST BUILD dynamic library for android or else crashes. Also these following properties might be required to not crash
    CONFIG+=exceptions
    QMAKE_CXXFLAGS += -fexceptions -frtti
    DEFINES += ANDROID_CPP_FEATURES="rtti\ exceptions"
    DEFINES += ANDROID_STL=c++_shared
} else: {
   CONFIG += staticlib \
}


CONFIG += \
    qzxing_qml \
    qzxing_multimedia \


include(src/QZXing.pro)

