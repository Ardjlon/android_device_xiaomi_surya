# Kernel
git clone https://github.com/stormbreaker-project/kernel_xiaomi_surya  -b rebase-comm kernel/xiaomi/surya

# Proton
git clone https://github.com/kdrag0n/proton-clang prebuilts/clang/host/linux-x86/clang-13 --depth=1
touch prebuilts/clang/host/linux-x86/clang-13/AndroidVersion.txt
echo "13" >> prebuilts/clang/host/linux-x86/clang-13/AndroidVersion.txt

# Disable Realme partitions
git -C build/tools fetch https://github.com/Evolution-X/build elle 75895232a2b045431589bcb31ed808cc86ebffa4
git -C build/tools revert 75895232a2b045431589bcb31ed808cc86ebffa4 --no-edit

# Firmware
git clone https://gitlab.com/Ardjlon/firmware_xiaomi_surya firmware/xiaomi/surya

# OP Launcher
git clone https://github.com/Ardjlon/vendor_OnePlusLauncher vendor/oplauncher
