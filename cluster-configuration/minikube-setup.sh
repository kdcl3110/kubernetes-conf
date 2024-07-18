#!/bin/bash

# Démarrer Minikube avec le driver Docker et 3 nœuds
minikube start --nodes 3

# Étiqueter les nœuds
kubectl label node minikube-m02 role=front-end
kubectl label node minikube-m03 role=back-end
kubectl label node minikube role=devops

#Vérification0
kubectl get nodes --show-labels

