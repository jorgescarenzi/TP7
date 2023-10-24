#!/usr/bin/env bash

for id in $(docker ps -q -a -f name=ecomdbtest)
do
        echo "stopping container ${id}"
        docker stop "${id}"
        docker rm "${id}"
done
