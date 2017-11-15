# Copyright (C) 2015-17 UBER Project
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

# Compile libhwui in performance mode
HWUI_COMPILE_FOR_PERF := true

# Override undesired Google defaults
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.com.google.clientidbase=android-google \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.setupwizard.require_network=any \
    ro.setupwizard.mode=OPTIONAL \
    ro.opa.eligible_device=true

# We got new substratum
PRODUCT_PROPERTY_OVERRIDES += \
    ro.substratum.verified=true

# Include Substratum unless SUBSTRATUM is set to false
ifneq ($(SUBSTRATUM),false)
    PRODUCT_PACKAGES += \
        Substratum
endif

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/uber/overlay/common

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_COPY_FILES += \
    vendor/uber/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip

# Include APN information
PRODUCT_COPY_FILES += vendor/uber/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Additional Packages
PRODUCT_PACKAGES += \
    DeskClock \
    LockClock \
    ThemeInterfacer \
    webview

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    CellBroadcastReceiver \
    Stk \
    telephony-ext \
    ims-ext-common \
    Telecom

PRODUCT_BOOT_JARS += \
    telephony-ext

# Skip boot jars check
SKIP_BOOT_JARS_CHECK := true

# QMI
PRODUCT_PACKAGES += \
    libjson

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += libprotobuf-cpp-full

# TCP Connection Management
PRODUCT_PACKAGES += tcmiface
PRODUCT_BOOT_JARS += tcmiface

# RCS Service
PRODUCT_PACKAGES += \
    rcscommon \
    rcscommon.xml \
    rcsservice \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_aidl_static \
    rcs_service_api \
    rcs_service_api.xml

# Bluetooth Audio (A2DP)
PRODUCT_PACKAGES += libbthost_if

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG := false

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# Squisher Location
SQUISHER_SCRIPT := vendor/uber/tools/squisher
