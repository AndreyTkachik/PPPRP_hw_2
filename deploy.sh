#!/bin/bash

kubectl apply -f kuber/config-map.yaml
kubectl apply -f kuber/pod.yaml 
kubectl apply -f kuber/deployment.yaml
kubectl apply -f kuber/service-cluster.yaml
kubectl apply -f kuber/daemon-set.yaml
kubectl apply -f kuber/cronejob.yaml

istioctl install --set profile=demo --set "values.global.proxy.resources.requests.cpu=10m" --set "values.global.proxy.resources.requests.memory=100Mi" -y
kubectl label namespace default istio-injection=enabled

kubectl apply -f kuber/gateway.yaml
kubectl apply -f kuber/virtual-service.yaml
kubectl apply -f kuber/destination-rule.yaml