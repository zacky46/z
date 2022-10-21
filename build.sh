#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/Evolution-X/manifest -b tiramisu -g default,-mips,-darwin,-notdefault
git clone https://github.com/yanzszs/local_manifest --depth 1 -b whyred-evo-x-13 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch evolution_whyred-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=zacky
export KBUILD_BUILD_HOST=cirrus
export BUILD_USERNAME=zacky
export BUILD_HOSTNAME=cirrus
# export USE_MICROG=true
export USE_GAPPS=true
mka evolution -j8
# end 
