LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RemovePkgs
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := \
        AmbientSensePrebuilt \
        Aperture \
        AppDirectedSMSService \
		Camera \
        Camera2 \
        ConnMO \
        DCMO \
        DMService \
        DevicePolicyPrebuilt \
        Drive \
        Flipendo \
        GCS \
        GrapheneOSCamera \
        MaestroPrebuilt \
        Maps \
        MicropaperPrebuilt \
        MyVerizonServices \
        OBDM_Permissions \
        Ornament \
        PrebuiltGmail \
        RecorderPrebuilt \
        SCONE \
        ScribePrebuilt \
        Showcase \
        Snap \
        SoundAmplifierPrebuilt \
        SprintDM \
        SprintHM \
        TurboPrebuilt \
        Tycho \
        USCCDM \
        VZWAPNLib \
        VzwOmaTrigger \
        WallpapersBReel2020 \
        YouTube \
        YouTubeMusicPrebuilt \
        arcore \
        obdm_stub
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
