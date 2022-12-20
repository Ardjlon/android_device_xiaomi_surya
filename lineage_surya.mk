#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from surya device
$(call inherit-product, device/xiaomi/surya/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_surya
PRODUCT_DEVICE := surya
PRODUCT_BRAND := POCO
PRODUCT_MODEL := M2007J20CG
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Aditional stuffs
TARGET_SUPPORTS_BLUR := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_GAPPS_ARCH := arm64
WITH_GMS := true

# Rice stuffs
RICE_CHIPSET := Qualcomm Snapdragon™ 732G
RICE_PACKAGE_TYPE := AOSP
RICE_MAINTAINER := Ardjlon
TARGET_OPTOUT_GOOGLE_TELEPHONY := true

# MEME Camera
$(call inherit-product, vendor/miuicamera/config.mk)
