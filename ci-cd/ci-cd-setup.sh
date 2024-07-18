#!/bin/bash

kubectl apply -f ci-cd-tools-namespace.yaml
kubectl apply -f jenkins-pvc.yaml
kubectl apply -f jenkins-deployment.yaml
kubectl apply -f jenkins-service.yaml