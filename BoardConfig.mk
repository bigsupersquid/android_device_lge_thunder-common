-include vendor/lge/thunder-common/BoardConfigVendor.mk
-include device/lge/msm7x27-common/BoardConfigCommon.mk

TARGET_KERNEL_SOURCE 				:= kernel/lge/msm7x27-3.0.x

ARM_EABI_TOOLCHAIN 					:= $(ANDROID_BUILD_TOP)/prebuilt/linux-x86/toolchain/arm-unknown-eabi-4.7/bin
#ARM_EABI_TOOLCHAIN 				:= $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.9/bin 
#TARGET_GCC_VERSION_AND 				:= 4.7-sm

## Boot loader & recovery
SKIP_SET_METADATA 					:= true
ifneq (eng,$(TARGET_BUILD_VARIANT))
else
MINIGZIP 							:= $(shell which lzma)
endif

DEVICE_RESOLUTION 					:= 320x480
RECOVERY_GRAPHICS_USE_LINELENGTH 	:= true
HAVE_SELINUX 						:= true
BOARD_HAS_NO_SELECT_BUTTON 			:= true
BOARD_USE_CUSTOM_RECOVERY_FONT 		:= \"font_7x16.h\"
TARGET_RECOVERY_PIXEL_FORMAT 		:= "RGB_565"
SMALLER_FONT_FOOTPRINT 				:= true
TARGET_NO_SEPARATE_RECOVERY 		:= true

TARGET_NO_INITLOGO 					:= true
TARGET_RECOVERY_LCD_BACKLIGHT_PATH 	:= \"/sys/class/leds/lcd-backlight/brightness\"
TARGET_USERIMAGES_USE_F2FS 			:= true
TARGET_USERIMAGES_USE_EXT4 			:= true

TW_BRIGHTNESS_PATH 					:= /sys/class/leds/lcd-backlight/brightness
TW_EXCLUDE_SUPERSU 					:= true
TW_EXCLUDE_ENCRYPTED_BACKUPS 		:= true
TW_MAX_BRIGHTNESS 					:= 255
TW_NO_SCREEN_BLANK 					:= 
TW_NO_REBOOT_BOOTLOADER 			:= false
TW_CUSTOM_POWER_BUTTON 				:= 107

#Camera
TARGET_PREBUILT_LIBCAMERA :=
TARGET_SPECIFIC_HEADER_PATH 		:= device/lge/thunder-common/include3x 
TARGET_CAMERA_SENSOR_MP_SIZE 		:= 3

## OTA script extras file and trash file (build/tools/releasetools)
TARGET_OTA_EXTRAS_FILE 				:= device/lge/thunder-common/releasetools/extras.txt
TARGET_OTA_TRASH_FILE 				:= device/lge/thunder-common/releasetools/trash.txt
