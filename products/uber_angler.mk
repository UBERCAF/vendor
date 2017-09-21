# Inherit AOSP device configuration for angler.
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Inherit common product files.
$(call inherit-product, vendor/uber/config/common.mk)



# Setup device specific product configuration.
PRODUCT_NAME := uber_angler
PRODUCT_BRAND := google
PRODUCT_DEVICE := angler
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := huawei

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    BUILD_FINGERPRINT=google/angler/angler:7.1.2/N2G48C/4104010:user/release-keys \
    PRIVATE_BUILD_DESC="angler-user 7.1.2 N2G48C 4104010 release-keys"

# Boot animation
PRODUCT_COPY_FILES += \
    vendor/uber/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip

