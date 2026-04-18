#!/bin/bash
# shellcheck disable=SC1091

[ -z "$CONTAINER_RT" ] && CONTAINER_RT=docker
[ -z "$BASE_IMAGE"] && BASE_IMAGE=vbatts/slackware:latest

mkdir -p $PWD/archive

$CONTAINER_RT run --rm --tmpfs /tmp \
    -v "$PWD/archive:/mnt/output:rw" \
    -e TZ="America/New_York" \
    -e OUTPUT_DIR="/mnt/output" \
    -v "$PWD/source:/mnt/source:ro" \
    $BASE_IMAGE \
    /mnt/source/makepkg-unraid.sh "$UI_VERSION_LETTER"