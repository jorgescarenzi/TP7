#!/bin/bash

response=$(curl -s -o /dev/null -w "%{http_code}\n" http://localhost:1000/#product-list)
if [ "$response" != "200" ] 
   then
   echo "TEST FAILED ---------------------"
   docker stop $(docker ps -a -q)
   docker rm $(docker ps -a -q)
   docker rmi jorgescarenzi/ecom:$BUILD_NUMBER
   exit 1
      else
        echo "TEST PASSED------------------"
        fi
