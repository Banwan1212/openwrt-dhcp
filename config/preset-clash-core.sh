#!/bin/bash
#=================================================
# File name: perest-clash-core.sh
# System Required: Linux
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

echo -e "预置Clash内核"
mkdir -p luci-app-openclash/root/etc/openclash/core
CLASH_DEV_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-amd64.tar.gz"
CLASH_TUN_URL=$(curl -fsSL https://api.github.com/repos/vernesong/OpenClash/contents/master/premium\?ref\=core | grep download_url | grep amd64 | awk -F '"' '{print $4}')
CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz"
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
wget -qO- $CLASH_DEV_URL | tar xOvz > luci-app-openclash/root/etc/openclash/core/clash
wget -qO- $CLASH_TUN_URL | gunzip -c > luci-app-openclash/root/etc/openclash/core/clash_tun
wget -qO- $CLASH_META_URL | tar xOvz > luci-app-openclash/root/etc/openclash/core/clash_meta
wget -qO- $GEOIP_URL > luci-app-openclash/root/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > luci-app-openclash/root/etc/openclash/GeoSite.dat
chmod +x luci-app-openclash/root/etc/openclash/core/clash*
