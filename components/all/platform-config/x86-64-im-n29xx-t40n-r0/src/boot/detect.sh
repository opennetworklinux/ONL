# Default platform detection.
# TODO IMT: no boardkeeper at that time.
#if grep -q "IM2972P" /sys/devices/board/primary/product; then
# TODO IMT: support for other cpu's?
if grep -q "^model.*: AMD G-T40N Processor$" /proc/cpuinfo; then
    echo "x86-64-im-n29xx-t40n-r0" >/etc/onl_platform
    exit 0
else
    exit 1
fi
