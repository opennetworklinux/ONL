#!/bin/sh
############################################################
#
# Copyright 2015 Interface Masters Technologies, Inc.
#
# BCM kernel module initialization for x86-64-im-n29xx-t40n-r0
#
# TODO: IMT do not have versions of modules in name.
# TODO: correct kernel bde arguments.
# The only argument is the SDK version suffix for the
# required modules.
#
############################################################
set -e

version=$1

if [ "${version}" = "" ]; then
    echo "usage: $0 <version>"
    exit 1
fi

insmod /lib/modules/`uname -r`/linux-kernel-bde-${version}.ko maxpayload=128 himem=1 dmasize=32M
insmod /lib/modules/`uname -r`/linux-user-bde-${version}.ko
