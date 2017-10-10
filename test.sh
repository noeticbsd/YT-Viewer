#!/bin/bash
#sets raw proxy file
read -p "Enter Proxy List Name> " file
while read main;do
proxy=$(echo $main | cut -d ':' -f 1)
port=$(echo $main | cut -d ':' -f 2)
/bin/rm -f /.mozilla/firefox/*.default/*.sqlite /.mozilla/firefox/*default/sessionstore.js
/bin/rm -rf ~/.cache/mozilla/firefox/*.default/*
echo $proxy $port
export {http,https,ftp}_proxy="http://$proxy:$port"
xdg-open http://www.ipchicken.com
sleep 30s
wmctrl -c firefox
sleep 0.5s
unset {http,https,ftp}_proxy
done
