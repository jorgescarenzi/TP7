#!/bin/bash

response=$(curl -s -o /dev/null -w "%{http_code}\n" http://localhost:1000/#product-lit)
if [ "$response" != "200" ] 
   then
   exit 1
      else
        echo "TEST PASSED"
        fi
