#!/bin/bash

# Display commands and abort on error
set -x
set -e

# Start minikube
minikube start --cpus=4 --memory=6g --addons=ingress

# Clone awx-operator repository
if [ -d "awx-operator" ]; then rm -Rf awx-operator; fi
git clone https://github.com/ansible/awx-operator.git

# Run the make deploy command
cd awx-operator
export NAMESPACE=my-namespace
git checkout 2.19.1
make deploy

# Apply the stack, patch the service to get a constant node port.
kubectl config set-context --current --namespace=$NAMESPACE
kubectl apply -f awx-demo.yml
kubectl patch svc awx-demo-service --type merge -p '{"spec":{"ports":[{"nodePort":31000,"port":80,"targetPort":8052,"name":"http"}]}}'

