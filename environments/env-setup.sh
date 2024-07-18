#!/bin/bash

# Créer les namespaces
kubectl create namespace development
kubectl create namespace testing
kubectl create namespace production

# Appliquer les ResourceQuotas
kubectl apply -f ./resource-quotas/dev-quotas.yaml --namespace=development
kubectl apply -f ./resource-quotas/test-quotas.yaml --namespace=testing
kubectl apply -f ./resource-quotas/prod-quotas.yaml --namespace=production

# Appliquer les LimitRanges 
kubectl apply -f ./limit-ranges/dev-limits.yaml --namespace=development
kubectl apply -f ./limit-ranges/test-limits.yaml --namespace=testing
kubectl apply -f ./limit-ranges/prod-limits.yaml --namespace=production
