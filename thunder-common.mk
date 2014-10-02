CM_BUILDTYPE := EXPERIMENTAL
#CM_EXTRAVERSION := internal_bigsuperROM
CM_EXTRAVERSION := f2fs_os2sd_bigsuperROM
#CM_EXTRAVERSION := ext4_os2sd_bigsuperROM

# Don't include charger detection in recovery mode
#ifneq (eng,$(TARGET_BUILD_VARIANT))
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/checkbootreason:root/sbin/checkbootreason
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
#    $(LOCAL_PATH)/chargemode/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
#    $(LOCAL_PATH)/chargemode/chargerlogo:root/sbin/chargerlogo
#endif

# thunder-common configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thunder_keypad.kl:system/usr/keylayout/thunder_keypad.kl \
    $(LOCAL_PATH)/configs/thunder_keypad.kcm.bin:system/usr/keychars/thunder_keypad.kcm.bin \
    $(LOCAL_PATH)/configs/touch_mcs6000.idc:system/usr/idc/touch_mcs6000.idc \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# thunder-common bluetooth vendor configuration 
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

#P500_SPEAKER_IN_CALL_FIX 
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

#emoji fonts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/fonts/AndroidEmoji.ttf:system/fonts/AndroidEmoji.ttf \
    $(LOCAL_PATH)/prebuilt/fonts/NotoColorEmoji.ttf:system/fonts/NotoColorEmoji.ttf
    
# wallpapers and screensavers
PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml
PRODUCT_PACKAGES += \
Apollo \
Email \
SpeechRecorder \
VoicePlus \
PhotoTable \
WebView \
Basic \
Grass \
Galaxy4 \
HoloSpiral \
LivePicker \
MagicSmoke \
MusicVisualization \
NoiseField \
PhaseBeam \
librs_jni 
#dex2oat \
#core-libart \
#libart

# Camera
PRODUCT_PACKAGES += \
	libcamera \
    camera.msm7x27

# input
PRODUCT_PACKAGES += \
PCKeyboard \
libjni_pckeyboard

# more stuff
PRODUCT_PACKAGES += \
Email \
Launcher3
# dual-mode recovery
PRODUCT_COPY_FILES += \
    device/lge/thunder-common/recovery/twrp.fstab:recovery/root/etc/twrp.fstab \

#    $(LOCAL_PATH)/recovery/twrp_int.fstab:recovery/root/etc/recovery.fstab \
#    $(LOCAL_PATH)/recovery/twrp_sd.fstab:recovery/root/etc/twrp_sd.fstab \
#    $(LOCAL_PATH)/recovery/twrp_int.fstab:recovery/root/etc/twrp.fstab \
#    $(LOCAL_PATH)/recovery/twrp_int.fstab:recovery/root/etc/twrp_int.fstab


# Inherit products (Most specific first)
$(call inherit-product, vendor/lge/thunder-common/thunder-common-vendor.mk)
$(call inherit-product, device/lge/msm7x27-common/device.mk)
$(call inherit-product, vendor/lge/msm7x27-common/msm7x27-common-vendor-blobs.mk)

# dual-mode recovery
PRODUCT_COPY_FILES += \
    device/lge/thunder-common/recovery/twrp.fstab:recovery/root/etc/twrp.fstab \

#    $(LOCAL_PATH)/recovery/twrp_int.fstab:recovery/root/etc/recovery.fstab \
#    $(LOCAL_PATH)/recovery/twrp_sd.fstab:recovery/root/etc/twrp_sd.fstab \
#    $(LOCAL_PATH)/recovery/twrp_int.fstab:recovery/root/etc/twrp.fstab \
#    $(LOCAL_PATH)/recovery/twrp_int.fstab:recovery/root/etc/twrp_int.fstab

# Overrides
PRODUCT_NAME := thunder-common
PRODUCT_DEVICE := thunder-common
PRODUCT_MODEL := LG-thunder-common
PRODUCT_MANUFACTURER := LGE

# Common assets 
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi
$(call inherit-product, device/mdpi-common/mdpi.mk)

#override init.qcom.rc for mounting fs in init.(device).rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/init.qcom.rc:root/init.qcom.rc

DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.force_hw_ui=true 
        
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hdmi_out=false \
    debug.sf.hw=1 \
    debug.composition.type=mdp \
    persist.sys.purgeable_assets=1 \

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.jit.codecachesize=0 \
	dalvik.vm.checkjni=false \
	dalvik.vm.dexopt-data-only=0 \
	dalvik.vm.dexopt-flags=v=a,o=v,m=y,u=y \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=64m \
    dalvik.vm.heapsize=128m \
    dalvik.vm.heaptargetutilization=0.80 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=2m \
    dalvik.vm.dexopt-data-only=0 \
    dalvik.vm.verify-bytecode=false \
    dalvik.vm.stack-trace-file=/data/anr/traces.txt \
    dalvik.vm.jniopts=forcecopy \
    dalvik.vm.execution-mode=int:fast
