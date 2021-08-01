# Kernel
git clone https://github.com/stormbreaker-project/kernel_xiaomi_surya  -b rebase-comm kernel/xiaomi/surya

# Proton
git clone https://github.com/kdrag0n/proton-clang prebuilts/clang/host/linux-x86/clang-13 --depth=1
touch prebuilts/clang/host/linux-x86/clang-13/AndroidVersion.txt
echo "13" >> prebuilts/clang/host/linux-x86/clang-13/AndroidVersion.txt
