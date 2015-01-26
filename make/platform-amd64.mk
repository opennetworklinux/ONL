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
# x86 Loader and Platform Package Build Rules
#
############################################################

# The kernel image must be specified:
ifndef KERNEL.BIN
$(error $$KERNEL.BIN is not set)
endif

# The initrd must be specified:
ifndef INITRD
$(error $$INITRD is not set)
endif

# Platform name must be set
ifndef PLATFORM_NAME
$(error $$PLATFORM_NAME is not set)
endif

all: onl.$(PLATFORM_NAME).loader

# Rule to build the grub Loader Image
onl.$(PLATFORM_NAME).loader: $(KERNEL.BIN) $(INITRD)
	$(ONL_V_GEN)set -e ;\
	if $(ONL_V_P); then set -x; fi ;\
	cp $(KERNEL.BIN) ./onl.vmlinuz; \
	cp $(INITRD) ./onl.initrd; \
	zip $@ onl.vmlinuz onl.initrd;

clean:
	rm -f *.loader onl.vmlinuz onl.initrd
