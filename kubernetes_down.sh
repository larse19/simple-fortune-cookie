#!/bin/bash
echo "Deleting all deployments"
kubectl delete deployments --all
echo "Deleting all services"
kubectl delete service --all
echo "Done"