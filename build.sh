#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/NusantaraProject-ROM/android_manifest -b 10 -g default,-mips,-darwin,-notdefault
git clone https://github.com/yanzszs/local_manifest --depth 1 -b main .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch nad_ginkgo-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=yanzszs
export KBUILD_BUILD_HOST=cirrus
export BUILD_USERNAME=yanzszs
export BUILD_HOSTNAME=cirrus
# export USE_MICROG=true
export USE_GAPPS=true
mka nad -j8
# end
