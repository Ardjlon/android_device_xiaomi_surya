#
# Copyright (C) 2021 Evolution X
# Copyright (C) 2021 Corvus OS
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/evolution_surya.mk \
    $(LOCAL_DIR)/corvus_surya.mk

COMMON_LUNCH_CHOICES := \
    evolution_surya-user \
    evolution_surya-userdebug \
    evolution_surya-eng \
    corvus_surya-user \
    corvus_surya-userdebug \
    corvus_surya-eng
