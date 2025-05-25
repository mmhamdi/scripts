#!/bin/bash


read -p "enter the service name :" service
if systemctl is-active "${service}";then 
	echo "${service} is active " 
else
	echo "${service}, $(date '+%Y-%m-%d %H:%M:%S')">monitor.txt
	cat <<EOF > restart.sh

#!/bin/bash 
systemctl is-active "${service}"  | systemctl restart  "${service}" 
EOF
	
	chmod +x restart.sh
	cronLine="*/5 * * * * $(pwd)/restart.sh"


	(crontab -l 2>/dev/nul |grep -Fv "${cronLine}";echo "${cronLine}" )|crontab - 
fi
