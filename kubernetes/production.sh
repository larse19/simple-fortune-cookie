#!/bin/bash

# sample value for your variables
PORT="31255"

# read the yml template from a file and substitute the string 
# {{MYVARNAME}} with the value of the MYVARVALUE variable
template=`cat "frontend-service.yaml.template" | sed "s/{{PORT}}/$PORT/g"`

# apply the yml with the substituted value
echo "$template" > frontend-service.yaml