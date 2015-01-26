############################################################
# <bsn.cl fy=2013 v=onl>
#
#        Copyright 2013, 2014 Big Switch Networks, Inc.
#        Copyright 2015 Interface Masters Technologies, Inc.
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
# Installer scriptlet for the x86-64-im-n29xx-t40n-r0
#

# Platform data goes here

# Interface Masters platform install
# ONL installer can be run from ONIE only.
# Hence we assume that flash/ssd already partitioned.
# ONL Loader would be installed to the same partition
# where ONIE lives, /boot (/dev/sda1).
# All the other space would be mounted as /mnt/flash (/dev/sda2).

# Format sda2 device
platform_grub_flash_format=1

platform_installer() {
    installer_standard_grub_blockdev_install sda
}
