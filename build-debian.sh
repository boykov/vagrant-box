#!/bin/bash

BUILD_OSNAME="debian"
BUILD_OSTYPE="Debian_64"

BOX="debian-7.7.0-amd64"
ISO_URL="http://debian.apt-get.eu/cd-images/7.7.0/amd64/iso-cd/debian-7.7.0-amd64-netinst.iso"
ISO_MD5="0b31bccccb048d20b551f70830bb7ad0"

./build.sh ${BUILD_OSNAME} ${BUILD_OSTYPE} ${BOX} ${ISO_URL} ${ISO_MD5}
