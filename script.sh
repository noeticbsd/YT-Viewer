#!/bin/bash
#sets raw proxy file

#read -p "Enter Proxy List Name> " file

xdg-settings set default-web-browser firefox.desktop
while read main;do
		/bin/rm ~/.mozilla/firefox/*.default/*.sqlite ~/.mozilla/firefox/*default/sessionstore.js
		echo $main
		export {http,https,ftp}_proxy="http://$main"
		xdg-open http://www.ipchicken.com
		sleep 40s
		wmctrl -c firefox
		sleep 0.5s
		unset {http,https,ftp}_proxy
done

