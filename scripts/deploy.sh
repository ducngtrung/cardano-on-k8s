#!/bin/bash

set -e  # Exit script if any command fails

echo "Applying Secrets..."
kubectl apply -f ../manifests/secrets/postgres-secret.yaml

echo "Applying Services..."
kubectl apply -f ../manifests/services/cardano-node-service.yaml
kubectl apply -f ../manifests/services/cardano-node-service.yaml

echo "Applying StatefulSets..."
kubectl apply -f ../manifests/statefulsets/cardano-node-statefulset.yaml
kubectl apply -f ../manifests/statefulsets/cardano-db-sync-statefulset.yaml

echo "Waiting for pods to become ready..."
kubectl wait --for=condition=Ready pod -l app=cardano-node --timeout=300s
kubectl wait --for=condition=Ready pod -l app=cardano-db-sync --timeout=300s

echo "Applying Pod Autoscalers..."
kubectl apply -f ../manifests/hpa/cardano-node-hpa.yaml
kubectl apply -f ../manifests/hpa/cardano-db-sync-hpa.yaml

echo "Deployment completed."