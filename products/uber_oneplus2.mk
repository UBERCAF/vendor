# Inherit AOSP device configuration for oneplus2.
$(call inherit-product, device/oneplus/oneplus2/aosp_oneplus2.mk)

# Inherit common product files.
$(call inherit-product, vendor/uber/config/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := uber_oneplus2
PRODUCT_BRAND := OnePlus
PRODUCT_DEVICE := oneplus2
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=oneplus2

# Boot animation
PRODUCT_COPY_FILES += \
    vendor/uber/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip
