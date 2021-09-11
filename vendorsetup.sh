# Kernel
git clone https://github.com/dotOS-Devices/android_kernel_xiaomi_surya/ -b dot11 kernel/xiaomi/surya

# Disable Realme partitions
git -C build/tools fetch https://github.com/Evolution-X/build elle 75895232a2b045431589bcb31ed808cc86ebffa4
git -C build/tools revert 75895232a2b045431589bcb31ed808cc86ebffa4 --no-edit

# Firmware
git clone https://gitlab.com/Ardjlon/firmware_xiaomi_surya firmware/xiaomi/surya

# OP Launcher
git clone https://github.com/Ardjlon/vendor_OnePlusLauncher vendor/oplauncher

# Display Hals
git -C hardware/qcom-caf/sm8150/display remote add pixel https://github.com/PixelExperience/hardware_qcom-caf_sm8150_display
git -C hardware/qcom-caf/sm8150/display fetch pixel && git -C hardware/qcom-caf/sm8150/display checkout pixel/eleven

# Google Camera Parrot
git clone https://github.com/ririxichan/vendor_GoogleCamera vendor/GoogleCamera

# EVA GCC
git clone --depth=1 https://github.com/mvaisakh/gcc-arm64 prebuilts/gcc/linux-x86/aarch64/aarch64-elf
git clone --depth=1 https://github.com/mvaisakh/gcc-arm prebuilts/gcc/linux-x86/arm/arm-eabi
