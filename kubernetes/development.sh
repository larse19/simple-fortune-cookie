#!/bin/bash

# sample value for your variables
PORT="32746"
FRONTEND_NAME="dev-frontend"
BACKEND_NAME="dev-backend"
DB_NAME="dev-redis"

# read the yml template from a file and substitute the string 
# {{MYVARNAME}} with the value of the MYVARVALUE variable
template1=`cat "frontend-service.yaml.template" | sed "s/{{PORT}}/$PORT/g" | sed "s/{{NAME}}/$FRONTEND_NAME/g"` 
template2=`cat "frontend-deployment.yaml.template" | sed "s/{{NAME}}/$FRONTEND_NAME/g"`
template3=`cat "backend-service.yaml.template" | sed "s/{{NAME}}/$BACKEND_NAME/g"`
template4=`cat "backend-deployment.yaml.template" | sed "s/{{NAME}}/$BACKEND_NAME/g"`
template5=`cat "redis-service.yaml.template" | sed "s/{{NAME}}/$DB_NAME/g"`
template6=`cat "redis-deployment.yaml.template" | sed "s/{{NAME}}/$DB_NAME/g"`

# apply the yml with the substituted value
echo "$template1" | kubectl apply -f -
echo "$template2" | kubectl apply -f -
echo "$template3" | kubectl apply -f -
echo "$template4" | kubectl apply -f -
echo "$template5" | kubectl apply -f -
echo "$template6" | kubectl apply -f -