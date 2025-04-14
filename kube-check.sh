#!/bin/bash

echo "Checking Kubernetes Pods..."
kubectl get pods

echo "Checking Services..."
kubectl get svc

echo "Check Deployment Status..."
kubectl rollout status deployment/flask-chart

