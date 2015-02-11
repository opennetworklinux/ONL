#!/usr/bin/python
############################################################
#
# Copyright 2015 Interface Masters Technologies, Inc.
#
# Platform Driver for x86-64-im-n29xx-t40n-r0
#
############################################################
import os
import struct
import time
import subprocess
from onl.platform.base import *
from onl.vendor.imt import *

class OpenNetworkPlatformImplementation(OpenNetworkPlatformIMT):

    def model(self):
        return 'IM2972P'

    def platform(self):
        return 'x86-64-im-n29xx-t40n-r0'

    def _plat_info_dict(self):
        return {
            platinfo.LAG_COMPONENT_MAX : 16,
            platinfo.PORT_COUNT : 54
            }

    def _plat_oid_table(self):
        return None

    def get_environment(self):
        return "Not implemented."

if __name__ == "__main__":
    import sys

    p = OpenNetworkPlatformImplementation()
    if len(sys.argv) == 1 or sys.argv[1] == 'info':
        print p
    elif sys.argv[1] == 'env':
        print p.get_environment()
