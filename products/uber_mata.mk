# Copyright (C) 2016-2017 UBERROMS
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

# Inherit common product files.
$(call inherit-product, vendor/uber/config/common.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

TARGET_BOOT_ANIMATION_RES := 1080

# Vendor blobs
$(call inherit-product, vendor/essential/mata/mata-vendor.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/essential/mata/device.mk)

# Advanced platform features
TARGET_WANTS_EXTENDED_DPM_PLATFORM := true
TARGET_DISABLE_DASH := false
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# A/B updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# Boot control HAL
PRODUCT_PACKAGES += \
    bootctrl.msm8998 \
    bootctl

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.msm8998 \
    librecovery_updater_msm \
    libsparse_static

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/essential/mata/overlay

include device/qcom/common/common.mk

# Device identifiers
PRODUCT_DEVICE := mata
PRODUCT_NAME := uber_mata
PRODUCT_BRAND := essential
PRODUCT_MODEL := Essential PH-1
PRODUCT_MANUFACTURER := essential
PRODUCT_RELEASE_NAME := mata

PRODUCT_BUILD_PROP_OVERRIDES += \
        PRODUCT_NAME=mata \
        BUILD_FINGERPRINT=essential/mata/mata:7.1.1/NMJ32F/436:user/release-keys \
        PRIVATE_BUILD_DESC="mata-user 7.1.1 NMJ32F 436 release-keys"

# TWRP
ifeq ($(WITH_TWRP),true)
$(call inherit-product, device/essential/mata/twrp/twrp.mk)
else
TARGET_RECOVERY_FSTAB := device/essential/mata/rootdir/root/fstab.mata
endif

GAPPS_VARIANT := nano
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
