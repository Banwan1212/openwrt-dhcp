#!/bin/bash

# 修改主机名字，把 OpenWrt-DDD 修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/OpenWrt/OpenWrt-DDD/g' package/base-files/files/bin/config_generate
# sed -i 's/Authorization Required/wanuse.com/g' feeds/luci/modules/luci-base/ucode/template/sysauth.ut
sed -i 's/Authorization Required/openwrt-23.05.2 wanuse.com/g' feeds/luci/themes/luci-theme-bootstrap/htdocs/luci-static/resources/view/bootstrap/sysauth.js
sed -i 's/需要授权/openwrt-23.05 wanuse.com/g' feeds/luci/modules/luci-base/po/zh_Hans/base.po

# 添加第三方应用

mkdir kiddin9
pushd kiddin9
git clone --depth=1 https://github.com/Banwan1212/kwrt-packages .
popd
mkdir ddd
pushd ddd
git clone --depth=1 https://github.com/Banwan1212/openwrt-dhcp/tree/main/packages .
popd
mkdir package/community
pushd package/community

# passwall和ssr 合集helloworld
mkdir passwall
pushd passwall
git clone --depth=1 https://github.com/Banwan1212/small .
popd
#-------------------------
# openclash
mkdir luci-app-openclash
cp -rf ../../kiddin9/luci-app-openclash/* luci-app-openclash

# python ssr
mkdir luci-app-ssrserver-python
cp -rf ../../kiddin9/luci-app-ssrserver-python/* luci-app-ssrserver-python

#Diskman
mkdir luci-app-diskman
cp -rf ../../kiddin9/luci-app-diskman/* luci-app-diskman

# 去广告
#ADGuardHome（kiddin9）
mkdir luci-app-adguardhome
mkdir adguardhome
cp -rf ../../kiddin9/luci-app-adguardhome/* luci-app-adguardhome
cp -rf ../../kiddin9/adguardhome/* adguardhome

# 文件助手
mkdir filebrowser
mkdir luci-app-filebrowser-go
mkdir luci-app-fileassistant

cp -rf ../../ddd/luci-app-filebrowser-go/* luci-app-filebrowser-go
cp -rf ../../ddd/filebrowser/* filebrowser
cp -rf ../../kiddin9/luci-app-fileassistant/* luci-app-fileassistant

# VPN服务器
mkdir luci-app-pptp-server
mkdir luci-app-openvpn-server
cp -rf ../../kiddin9/luci-app-pptp-server/* luci-app-pptp-server
cp -rf ../../kiddin9/luci-app-openvpn-server/* luci-app-openvpn-server

# Windows激活
mkdir vlmcsd
mkdir luci-app-vlmcsd
cp -rf ../../kiddin9/vlmcsd/* vlmcsd
cp -rf ../../kiddin9/luci-app-vlmcsd/* luci-app-vlmcsd

# 关机
mkdir luci-app-poweroffdevice
cp -rf ../../kiddin9/luci-app-poweroffdevice/* luci-app-poweroffdevice

# UPNP
mkdir luci-app-upnp
cp -rf ../../kiddin9/luci-app-upnp/* luci-app-upnp

# 监控CPU性能
mkdir netdata
mkdir luci-app-netdata
cp -rf ../../kiddin9/luci-app-netdata/* luci-app-netdata
cp -rf ../../kiddin9/netdata/* netdata
# git clone https://github.com/sirpdboy/luci-app-netdata luci-app-netdata

# 网络共享（Samba4）
mkdir luci-app-samba4
cp -rf ../../kiddin9/luci-app-samba4/* luci-app-samba4

# aria2下载工具
mkdir luci-app-aria2
mkdir aria2
cp -rf ../../kiddin9/luci-app-aria2/* luci-app-aria2
cp -rf ../../kiddin9/aria2/* aria2

#定时任务
mkdir luci-app-autotimeset
cp -rf ../../kiddin9/luci-app-autotimeset/* luci-app-autotimeset

# 测速
mkdir homebox
mkdir luci-app-netspeedtest
cp -rf ../../kiddin9/homebox/* homebox
cp -rf ../../kiddin9/luci-app-netspeedtest/* luci-app-netspeedtest

#docker
mkdir luci-app-docker
cp -rf ../../kiddin9/luci-app-docker/* luci-app-docker
mkdir luci-app-zerotier
cp -rf ../../kiddin9/luci-app-zerotier/* luci-app-zerotier
#实时流量监控
mkdir wrtbwmon
mkdir luci-app-wrtbwmon
cp -rf ../../kiddin9/wrtbwmon/* wrtbwmon
cp -rf ../../kiddin9/luci-app-wrtbwmon/* luci-app-wrtbwmon
popd
# turboacc堵塞优化和依赖
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh
