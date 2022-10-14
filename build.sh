#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/bananadroid/android_manifest.git -b 12 -g default,-mips,-darwin,-notdefault
git clone https://github.com/NFS-project/local_manifest --depth 1 -b banana-12 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
export NFS_TARGET_BUILD_ROM=bananadroid
source build/envsetup.sh
lunch banana_ginkgo-user
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=zacky
export KBUILD_BUILD_HOST=nfsproject
export BUILD_USERNAME=zacky
export BUILD_HOSTNAME=nfsproject
m banana
# end 
