# ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● #
# 下载 OpenClash 内核
grep "CONFIG_PACKAGE_luci-app-openclash=y" $WORKPATH/$CUSTOM_SH >/dev/null
if [ $? -eq 0 ]; then
  echo "正在执行：为OpenClash下载内核"
  mkdir -p $HOME/clash-core
  mkdir -p $HOME/files/etc/openclash/core
  cd $HOME/clash-core
# 下载Dve内核
  wget -q https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-amd64.tar.gz
  if [[ $? -ne 0 ]];then
    wget -q https://github.com/vernesong/OpenClash/releases/download/Clash/clash-linux-amd64.tar.gz
  else
    echo "OpenClash Dve内核压缩包下载成功，开始解压文件"
  fi
  tar -zxvf clash-linux-amd64.tar.gz
  if [[ -f "$HOME/clash-core/clash" ]]; then
    mkdir -p $HOME/files/etc/openclash/core
    mv -f $HOME/clash-core/clash $HOME/files/etc/openclash/core/clash
    chmod +x $HOME/files/etc/openclash/core/clash
    echo "OpenClash Dve内核配置成功"
  else
    echo "OpenClash Dve内核配置失败"
  fi
  rm -rf $HOME/clash-core/clash-linux-amd64.tar.gz
# 下载Meta内核
  wget -q https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz
  if [[ $? -ne 0 ]];then
    wget -q https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz
  else
    echo "OpenClash Meta内核压缩包下载成功，开始解压文件"
  fi
  tar -zxvf clash-linux-amd64.tar.gz
  if [[ -f "$HOME/clash-core/clash" ]]; then
    mv -f $HOME/clash-core/clash $HOME/files/etc/openclash/core/clash_meta
    chmod +x $HOME/files/etc/openclash/core/clash_meta
    echo "OpenClash Meta内核配置成功"
  else
    echo "OpenClash Meta内核配置失败"
  fi
  rm -rf $HOME/clash-core/clash-linux-amd64.tar.gz
# 下载TUN内核
  wget -q  https://raw.githubusercontent.com/vernesong/OpenClash/core/master/core_version
  TUN="clash-linux-amd64-"$(sed -n '2p' core_version)".gz"
  wget -q https://raw.githubusercontent.com/vernesong/OpenClash/core/master/premium/$TUN
  if [[ $? -ne 0 ]];then
    wget -q https://raw.githubusercontent.com/vernesong/OpenClash/core/master/premium/$TUN
  else
    echo "OpenClash TUN内核压缩包下载成功，开始解压文件"
  fi
  gunzip  $TUN
  TUNS="$(ls | grep -Eo "clash-linux-amd64-.*")"
  if [[ -f "$HOME/clash-core/$TUNS" ]]; then
    mv -f $HOME/clash-core/clash-linux-amd64-* $HOME/files/etc/openclash/core/clash_tun
    chmod +x $HOME/files/etc/openclash/core/clash_tun
    echo "OpenClash TUN内核配置成功"
  else
    echo "OpenClash TUN内核配置失败"
  fi
  rm -rf $HOME/clash-core/$TUN

  rm -rf $HOME/clash-core
fi

# ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● #
