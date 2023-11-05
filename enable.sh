#!/bin/bash

service=$1

if [ -z "$service" ]
then
   echo "Services disponibles:"
   ls $PWD/services-available/
else
   echo "Enabling $service"
   ln -s $PWD/services-available/$service $PWD/services-enabled/$service
fi
