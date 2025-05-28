#!/bin/bash

#list of required packages 

packages=("curl" "ssh" "docker" "git")
missing=()

for pkg in "${packages[@]}";do 
    if ! command -v "${pkg}" >/dev/null 2>&1;then 
	echo "package ${pkg} is not installed ... "
	missing+=("${pkg}")
    else 
		echo "package ${pkg} is installed  :) "
    fi
done
if [ "${#missing[@]}" -ne 0 ] ; then 
	echo ""
	read -p  "do you want me to install them answer (y/n):" answer 
	if [[ "$answer" == "y" || "$answer" == "Y" ]] ; then 
		sudo apt install -y  "${missing[@]}"
	else
       		 echo "Exiting without installing packages."
        	 exit 1
	fi
else 
	echo "All required packages are installed !!"
fi
