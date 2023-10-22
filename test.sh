#!/bin/bash

response=$(curl -s -o /dev/null -w "%{http_code}\n" http://localhost:100/#product-list)
if [ "$response" != "200" ] 
   then
   echo "TEST FAILED ---------------------"
   exit 1
      else
        echo "TEST PASSED------------------"
        fi
