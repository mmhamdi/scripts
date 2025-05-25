#!/bin/bash

read -p  "enter the logs path : " log_path
logs=($(find "${log_path}" -type f -name "*.log" -mtime +7))
for  log in "${logs[@]}";do
	echo "$log"
	gzip "${log}"
done 
compressed_files=($(find "${log_path}" -type f -name "*.gz" -mtime +30))
for   compressed in "${compressed_files[@]}";do 
	rm -rf  "${compressed}"
	echo "delete compressed files oldest 30 days "
done 
