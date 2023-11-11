#!/bin/bash

service=$1

if [ -z "$service" ]
then
   echo "Services actifs :"
   ls $PWD/services-enabled/
else
   $PWD/down.sh
   echo "Disabling $service"
   rm $PWD/services-enabled/$service
   $PWD/up.sh
fi
