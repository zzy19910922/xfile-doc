#!/bin/bash

type jq >/dev/null 2>&1 || { echo >&2 "Please install jq"; exit 1; }

cd source

# access token to download asset
TOKEN="8c3d79dcddb19cfa96f87181f9b3bfb0afe9fa92"

WGET_ARGS="--auth-no-challenge"
HEADER="Accept:application/octet-stream"
PACKAGE_NAME="static.tar.gz"

ASSETS_ID_API="https://$TOKEN:@api.github.com/repos/cloudgz/project_s/releases/latest"
ASSETS_ID=$(curl -s $ASSETS_ID_API | jq -r '.assets[0].id')
DOWNLOAD_API="https://$TOKEN:@api.github.com/repos/cloudgz/project_s/releases/assets/$ASSETS_ID"

if [ ! -d ruihub_static ];then
    mkdir ruihub_static
fi

wget $WGET_ARGS --header=$HEADER $DOWNLOAD_API -O ruihub_static/$PACKAGE_NAME

tar -zxvf ruihub_static/$PACKAGE_NAME -C ruihub_static/
rm -f ruihub_static/$PACKAGE_NAME

