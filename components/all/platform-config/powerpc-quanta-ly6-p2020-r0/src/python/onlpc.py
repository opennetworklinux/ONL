#!/usr/bin/python
############################################################
# <bsn.cl fy=2013 v=onl>
# 
#        Copyright 2013, 2014 Big Switch Networks, Inc.       
# 
# Licensed under the Eclipse Public License, Version 1.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
# 
#        http://www.eclipse.org/legal/epl-v10.html
# 
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific
# language governing permissions and limitations under the
# License.
# 
# </bsn.cl>
############################################################
############################################################
#
# Platform Driver for the Quanta LY6 P2020
#
############################################################
import os
import struct
import time
import subprocess
from onl.platform.base import *
from onl.vendor.quanta import *

class OpenNetworkPlatformImplementation(OpenNetworkPlatformQuanta):

    def _eeprom_file(self):
        return "/sys/devices/soc.0/ffe03000.i2c/i2c-0/i2c-5/5-0054/eeprom"

    def model(self):
        return "LY6 P2020"

    def platform(self):
        return "powerpc-quanta-ly6-p2020-r0"

    def _plat_info_dict(self):
        return {
            platinfo.LAG_COMPONENT_MAX : 16,
            platinfo.PORT_COUNT : 32
            }

    def _plat_oid_table(self):
        return None

if __name__ == "__main__":
    print OpenNetworkPlatformImplementation()


