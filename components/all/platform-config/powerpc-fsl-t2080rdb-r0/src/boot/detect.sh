# Default platform detection.
if grep -q "^model.*: powerpc-fsl-t2080rdb-r0$" /proc/cpuinfo; then
    echo "powerpc-fsl-t2080rdb-r0" >/etc/onl_platform
    exit 0
else
    exit 1
fi

