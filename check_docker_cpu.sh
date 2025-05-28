#!/bin/bash

docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}'
