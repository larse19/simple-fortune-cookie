# sample value for your variables
PORT="31255"
FRONTEND_NAME="production-frontend"
BACKEND_NAME="production-backend"
DB_NAME="production-redis"

# read the yml template from a file and substitute the string 
# {{MYVARNAME}} with the value of the MYVARVALUE variable
template1=`cat "frontend-service.yaml.template" | sed "s/{{PORT}}/$PORT/g" | sed "s/{{NAME}}/$FRONTEND_NAME/g"` 
template2=`cat "frontend-deployment.yaml.template" | sed "s/{{NAME}}/$FRONTEND_NAME/g"`
template3=`cat "backend-service.yaml.template" | sed "s/{{NAME}}/$BACKEND_NAME/g"`
template4=`cat "backend-deployment.yaml.template" | sed "s/{{NAME}}/$BACKEND_NAME/g"`
template5=`cat "redis-service.yaml.template" | sed "s/{{NAME}}/$DB_NAME/g"`
template6=`cat "redis-deployment.yaml.template" | sed "s/{{NAME}}/$DB_NAME/g"`

# apply the yml with the substituted value
echo "$template1" > frontend-service.yaml
echo "$template2" > frontend-deployment.yaml
echo "$template3" > backend-service.yaml
echo "$template4" > backend-deployment.yaml
echo "$template5" > redis-service.yaml
echo "$template6" > redis-deployment.yaml