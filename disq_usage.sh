#!/bin/bash

usage=$(df -h / |tail -1|awk '{print $5}'|sed 's/%//' )
if [ "$usage" -ge 58 ];then 
    echo "$(date): Disk usage is ${usage}% - over threshold!" >> /var/log/disk_usage.log
fi

