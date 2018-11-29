mkdir -p build
cd build
rm -rf *

cmake \
-DANDROID_ABI=x86 \
-DANDROID_PLATFORM=android-25 \
-DCMAKE_BUILD_TYPE=Debug \
-DANDROID_NDK=$ANDROID_NDK \
-DANDROID_PIE=ON \
-DANDROID_TOOLCHAIN=gcc \
-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
../

make testing
adb push testing /data/data/
adb shell "cd /data/data && ./testing"
adb shell "cat /data/tombstones/tombstone_07" | $ANDROID_NDK/ndk-stack -sym `pwd`