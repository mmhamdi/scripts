#!/bin/bash

read -p "Enter the directory you want to backup:" dir 
tar -czf "backup.$(date +%F)".tar.gz  /home/mohamed/Desktop
ls -t "backup.$(date +%F)".tar.gz |tail -n 3 |xargs rm -f 
