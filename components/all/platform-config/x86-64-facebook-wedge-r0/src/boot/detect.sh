############################################################
# <bsn.cl fy=2013 v=none>
#
#        Copyright 2013, 2014 BigSwitch Networks, Inc.
#
#
#
# </bsn.cl>
############################################################
# Default platform detection.

buf="`dmidecode 2>&1 || :`"
case "$buf" in
  *"Product Name: S4000"*)
    echo "x86-64-facebook-wedge-r0" >/etc/onl_platform
    exit 0
  ;;
esac

exit 1
