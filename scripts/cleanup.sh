#!/bin/bash

set -e  # Exit script if any command fails

echo "Deleting Pod Autoscalers..."
kubectl delete hpa cardano-node-hpa --ignore-not-found
kubectl delete hpa cardano-db-sync-hpa --ignore-not-found

echo "Deleting StatefulSets..."
kubectl delete statefulset cardano-node --ignore-not-found
kubectl delete statefulset cardano-db-sync --ignore-not-found

echo "Deleting Services..."
kubectl delete svc cardano-node-svc cardano-db-sync-svc --ignore-not-found

echo "Deleting Secrets..."
kubectl delete secret postgres-secret --ignore-not-found

echo "Deleting PersistentVolumeClaims..."
kubectl delete pvc -l app=cardano-node --ignore-not-found
kubectl delete pvc -l app=cardano-db-sync --ignore-not-found

echo "Cleanup complete."