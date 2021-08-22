#!/bin/bash

# sample value for your variables
PORT="32746"
FRONTEND_NAME="dev-frontend"
BACKEND_NAME="dev-backend"
DB_NAME="dev-redis"


# read the yml template from a file and substitute the string 
# {{MYVARNAME}} with the value of the MYVARVALUE variable
template1=`cat "frontend-service.yaml.template" | sed "s/{{PORT}}/$PORT/g" | sed "s/{{NAME}}/$FRONTEND_NAME/g"` 
template2=`cat "frontend-deployment.yaml.template" | sed "s/{{NAME}}/$FRONTEND_NAME/g" | sed "s/{{BACKEND_NAME}}/$BACKEND_NAME/g" | sed "s/{{IMAGE_TAG}}/$1/g"`
template3=`cat "backend-service.yaml.template" | sed "s/{{NAME}}/$BACKEND_NAME/g"`
template4=`cat "backend-deployment.yaml.template" | sed "s/{{NAME}}/$BACKEND_NAME/g" | sed "s/{{REDIS_NAME}}/$DB_NAME/g" | sed "s/{{IMAGE_TAG}}/$1/g"`
template5=`cat "redis-service.yaml.template" | sed "s/{{NAME}}/$DB_NAME/g"`
template6=`cat "redis-deployment.yaml.template" | sed "s/{{NAME}}/$DB_NAME/g"`

# apply the yml with the substituted value
echo "$template1" > ./services/frontend-service.yaml
echo "$template2" > ./deployments/frontend-deployment.yaml
echo "$template3" > ./services/backend-service.yaml
echo "$template4" > ./deployments/backend-deployment.yaml
echo "$template5" > ./services/redis-service.yaml
echo "$template6" > ./deployments/redis-deployment.yaml