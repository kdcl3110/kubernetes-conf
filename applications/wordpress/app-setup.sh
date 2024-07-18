#!/bin/bash

# Ajouter le dépôt Helm
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Appliquer les PV et PVC
kubectl apply -f ./pv/pv-development.yaml
kubectl apply -f ./pvc/pvc-development.yaml
kubectl apply -f ./pv/pv-testing.yaml
kubectl apply -f ./pvc/pvc-testing.yaml
kubectl apply -f ./pv/pv-production.yaml
kubectl apply -f ./pvc/pvc-production.yaml



# Déployer WordPress dans chaque namespace
helm upgrade --install wordpress-prod bitnami/wordpress -n production -f values/values-production.yaml
helm upgrade --install wordpress-test bitnami/wordpress -n testing -f values/values-testing.yaml
helm upgrade --install wordpress-dev bitnami/wordpress -n development -f values/values-development.yaml


