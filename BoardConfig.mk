# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from common msm8660
-include device/samsung/msm8660-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/i577/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := i577

TARGET_OTA_ASSERT_DEVICE := SGH-I577,i577,I577,Exhilarate,exhilarate

# Kernel
TARGET_KERNEL_CONFIG        := cyanogenmod_i577_defconfig
TARGET_KERNEL_SOURCE        := kernel/samsung/msm8660-common
BOARD_KERNEL_CMDLINE        := androidboot.hardware=qcom usb_id_pin_rework=true no_console_suspend=true zcache
BOARD_KERNEL_BASE           := 0x40400000
BOARD_KERNEL_PAGESIZE       := 2048
BOARD_FORCE_RAMDISK_ADDRESS := 0x41800000

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p22: 00A00000 00000200 "recovery"
#mmcblk0p8: 00A00000 00000200 "boot"
#mmcblk0p24: 22535000 00000200 "system"
#mmcblk0p26: 12E00000 00000200 "cache"
#mmcblk0p25: 48A00000 00000200 "userdata"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 575885312
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1218445312
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p28
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Suppress the WIPE command since it can brick our EMMC
BOARD_SUPPRESS_EMMC_WIPE := true

# Workaround for glitches while cropping bypass layers
TARGET_NO_BYPASS_CROPPING := true

# MTP
BOARD_MTP_DEVICE := "/dev/mtp_usb"

# Disable initlogo, Samsungs framebuffer is weird
TARGET_NO_INITLOGO := true

# Preload the boot animation to avoid jerkiness
TARGET_BOOTANIMATION_PRELOAD := true

