PRODUCT_BRAND ?= xpe

# bootanimation (Some devices cant go over 100fps for a bootani)
PRODUCT_COPY_FILES += \
    vendor/XPerience/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    persist.sys.root_access=1

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/XPerience/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/XPerience/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/XPerience/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/XPerience/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/XPerience/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/XPerience/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/XPerience/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with XPerience extras
PRODUCT_COPY_FILES += \
    vendor/XPerience/prebuilt/etc/init.local.rc:root/init.XPerience.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

# Dashclock
PRODUCT_COPY_FILES += \
    vendor/XPerience/prebuilt/app/DashClock.apk:system/app/DashClock.apk

# Additional packages
-include vendor/XPerience/config/packages.mk

# Versioning
-include vendor/XPerience/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/XPerience/overlay/common
