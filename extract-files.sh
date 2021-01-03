#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=coral
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

while [ "$1" != "" ]; do
    case $1 in
        -n | --no-cleanup )     CLEAN_VENDOR=false
                                ;;
        -s | --section )        shift
                                SECTION=$1
                                CLEAN_VENDOR=false
                                ;;
        --flame )               shift
                                FLAME_SRC=$1
                                ;;
        --coral )               shift
                                CORAL_SRC=$1
                                ;;
    esac
    shift
done

if [ -z "$SRC" ]; then
    SRC=adb
fi

function blob_fixup() {
    case "${1}" in

    # Fix xml version
    product/etc/permissions/vendor.qti.hardware.data.connection-V1.0-java.xml)
        sed -i 's/xml version="2.0"/xml version="1.0"/' "${2}"
        ;;

    esac
}

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$ANDROID_ROOT" false "$CLEAN_VENDOR"

extract "$MY_DIR"/coral-proprietary-files.txt "$CORAL_SRC" --section "$SECTION"
extract "$MY_DIR"/coral-proprietary-files-vendor.txt "$CORAL_SRC" --section "$SECTION"

# Reinitialize the helper for flame
DEVICE=flame
setup_vendor "$DEVICE" "$VENDOR" "$ANDROID_ROOT" false "$CLEAN_VENDOR"

extract "$MY_DIR"/flame-proprietary-files.txt "$FLAME_SRC" --section "$SECTION"
extract "$MY_DIR"/flame-proprietary-files-vendor.txt "$FLAME_SRC" --section "$SECTION"

"$MY_DIR"/setup-makefiles.sh
