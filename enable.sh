#!/bin/bash

service=$1

if [ -z "$service" ]
then
   echo "Services disponibles:"
   ls $PWD/services-available/
else
   $PWD/down.sh
   echo "Enabling $service"
   ln -s $PWD/services-available/$service $PWD/services-enabled/$service
   $PWD/up.sh
fi
