LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RemovePkgs
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := \
	AmbientSensePrebuilt \
	AndroidAutoStubPrebuilt \
	AppDirectedSMSService \
	ConnMO \
	DCMO \
	DMService \
	GCS \
	MaestroPrebuilt \
	Maps \
	MicropaperPrebuilt \
	MyVerizonServices \
	OBDM_Permissions \
	Ornament \
	SafetyHubPrebuilt \
	SCONE \
	ScribePrebuilt \
	Showcase \
	Snap \
	SoundAmplifierPrebuilt \
	SprintDM \
	SprintHM \
	Flipendo \
	Tycho \
	USCCDM \
	VZWAPNLib \
	VzwOmaTrigger \
	WallpapersBReel2020 \
	arcore \
	obdm_stub \
	DevicePolicyPrebuilt \
	RecorderPrebuilt \
	PrebuiltGmail \
	YouTube \
	YouTubeMusicPrebuilt \
	Drive \
        Camera2
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
