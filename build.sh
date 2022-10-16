#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/Evolution-X/manifest -b tiramisu -g default,-mips,-darwin,-notdefault
git clone https://github.com/MOBX-PROJECTS/local_manifest --depth 1 -b evox .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8


rm -rf hardware/google/pixel/kernel_headers/Android.bp

# build rom
source build/envsetup.sh
lunch evolution_spes-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=mobx
export KBUILD_BUILD_HOST=nfsproject
export BUILD_USERNAME=mobx
export BUILD_HOSTNAME=nfsproject
export WITH_GAPPS=true
mka evolution -j8
# end 

# build 6
