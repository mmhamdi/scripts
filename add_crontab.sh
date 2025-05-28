#!/bin/bash

read -p "enter the script you want to add as a cron job : " script 
cron_job="*/10 * * * *  ${script}" 
crontab -l 2>/dev/null | grep -F "$cron_job">/dev/null
if [ $? -ne 0 ]; then 
	(crontab -l 2>/dev/null;echo "$cron_job") | crontab -
	echo "cronjob is added succefuly"
else 
	echo "Cron job already exists."
fi
