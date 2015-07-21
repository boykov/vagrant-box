#!/bin/bash

BUILD_OSNAME="ubuntu"
BUILD_OSTYPE="Ubuntu_64"

BOX="ubuntu-14.04-amd64"
ISO_URL="http://old-releases.ubuntu.com/releases/14.04.0/ubuntu-14.04-server-amd64.iso"
ISO_MD5="01545fa976c8367b4f0d59169ac4866c"

./build.sh ${BUILD_OSNAME} ${BUILD_OSTYPE} ${BOX} ${ISO_URL} ${ISO_MD5}
