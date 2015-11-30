############################################################
# <bsn.cl fy=2015 v=onl>
#
# Copyright 2015 Freescale Semiconductor, Inc.
#
# Shengzhou Liu <Shengzhou.Liu@freescale.com>
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
#
# Installer scriptlet for the powerpc-fsl-p2041rdb-r0
#

# The loader must be written raw to the first partition.
platform_loader_raw=1
# The loader is installed in the fat partition of the first USB storage device
platform_bootcmd='usb start; usbboot 0x10000000 0:1; setenv bootargs console=$consoledev,$baudrate onl_platform=powerpc-fsl-p2041rdb-r0; bootm 0x10000000'

platform_installer() {
    # Standard installation to usb storage
    installer_standard_blockdev_install sda 16M 64M ""
}
