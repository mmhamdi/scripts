#!/bin/bash
for container in $(docker ps -a -f status=exited -q);do 
	docker rm "${container}" 
	echo "$container is deleted succefuly !!"
done 
for image in $(docker images -f dangling=true -q);do
	docker rmi  "${image}"
	echo "$image is deleted succefuly !!"
done
