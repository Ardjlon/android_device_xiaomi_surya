#
# Copyright (C) 2021 AOSP
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_surya.mk \
    $(LOCAL_DIR)/evolution_surya.mk \
    $(LOCAL_DIR)/ancient_surya.mk \
    $(LOCAL_DIR)/spark_surya.mk

COMMON_LUNCH_CHOICES := \
    aosp_surya-user \
    aosp_surya-userdebug \
    aosp_surya-eng \
    evolution_surya-user \
    evolution_surya-userdebug \
    evolution_surya-eng \
    ancient_surya-user \
    ancient_surya-userdebug \
    ancient_surya-eng \
    spark_surya-user \
    spark_surya-userdebug \
    spark_surya-eng
