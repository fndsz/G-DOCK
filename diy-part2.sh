#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
device_name='G-DOCK'
wifi_name='G-DOCK'
lan_ip='192.168.7.1'        # Lan Ip地址
utc_name='Asia\/Shanghai'   # 时区
 
#修改机器名称
echo "设置主机名"
sed -i "s/OpenWrt/$device_name/g" package/base-files/files/bin/config_generate

# Modify default IP
echo "设置lan ip"
sed -i "s/192.168.7.1/$lan_ip/g" package/base-files/files/bin/config_generate

#修改默认时区
echo "修改时区"
sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='$utc_name'/g" package/base-files/files/bin/config_generate

#修改默认主题
echo '修改默认主题'
sed -i 's/config internal themes/config internal themes\n    option argon_armygreen  \"\/luci-static\/argon_armygreen\"/g' feeds/luci/modules/luci-base/root/etc/config/luci

echo "修改wifi名称"
sed -i "s/OpenWrt/$wifi_name/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

#echo '修改banner'
#rm -rf package/base-files/files/etc/banner
#cp -f ../banner package/base-files/files/etc/
