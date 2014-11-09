# Common settings and files
-include vendor/XPerience/config/common.mk

# Add tablet overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/XPerience/overlay/common_tablet

PRODUCT_CHARACTERISTICS := tablet
