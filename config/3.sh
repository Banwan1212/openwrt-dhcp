#!/bin/bash
# sed -i 's/192.168.1.1/192.168.1.82/g' package/base-files/files/bin/config_generate
# 静态 to DHCP
sed -i 's/-static/-dhcp/g' package/base-files/files/lib/functions/uci-defaults.sh
sed -i 's/none/dhcp/g' package/base-files/files/bin/config_generate
