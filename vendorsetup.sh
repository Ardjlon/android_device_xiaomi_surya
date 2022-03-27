# Disable Realme partitions
git -C build/tools fetch https://github.com/Evolution-X/build elle 75895232a2b045431589bcb31ed808cc86ebffa4
git -C build/tools revert 75895232a2b045431589bcb31ed808cc86ebffa4 --no-edit

# Firmware
git clone https://gitlab.com/Ardjlon/firmware_xiaomi_surya firmware/xiaomi/surya

# Display Hals
git -C hardware/qcom-caf/sm8150/display remote add pixel https://github.com/PixelExperience/hardware_qcom-caf_sm8150_display
git -C hardware/qcom-caf/sm8150/display fetch pixel && git -C hardware/qcom-caf/sm8150/display checkout pixel/eleven

# Google Camera
git clone git@github.com:Ardjlon/vendor_GoogleCamera.git vendor/GoogleCamera

# PocoParts
git clone git@github.com:Ardjlon/vendor_PocoParts.git -b elle vendor/PocoParts
