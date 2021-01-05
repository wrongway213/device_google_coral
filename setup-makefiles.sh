#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=coral
DEVICE_COMMON=coral
VENDOR=google

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

ANDROID_ROOT="$MY_DIR"/../../..

HELPER="$ANDROID_ROOT"/tools/extract-utils/extract_utils.sh

if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$ANDROID_ROOT" true

# Warning headers and guards
write_headers "coral flame"

write_makefiles "$MY_DIR"/coral-proprietary-files.txt true
write_makefiles "$MY_DIR"/coral-proprietary-files-vendor.txt true

cat << EOF >> "$ANDROIDMK"
EOF

# Finish coral
write_footers

# Reinitialize the helper
DEVICE=flame
setup_vendor "$DEVICE" "$VENDOR" "$ANDROID_ROOT"

# Copyright headers and guards
write_headers

write_makefiles "$MY_DIR"/flame-proprietary-files.txt true
write_makefiles "$MY_DIR"/flame-proprietary-files-vendor.txt true

cat << EOF >> "$ANDROIDMK"
EOF

# Finish
write_footers
