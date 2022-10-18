#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/NusantaraProject-ROM/android_manifest -b 10 -g default,-mips,-darwin,-notdefault
git clone https://github.com/MOBX-PROJECTS/local_manifest --depth 1 -b nad .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch nad_juice-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=mobx
export KBUILD_BUILD_HOST=nfsproject
export BUILD_USERNAME=mobx
export BUILD_HOSTNAME=nfsproject
mka nad -j8
# end 

# build 7
