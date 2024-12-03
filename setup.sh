#!/bin/bash
kubectl apply -f 1-dc1/1-Namespace.yaml
kubectl -n consul-dc1 create secret generic consul-licence --from-file=consul.hclic
kubectl apply -f 2-dc2/1-Namespace.yaml
kubectl -n consul-dc2 create secret generic consul-licence --from-file=consul.hclic

kubectl apply -f 0-Monitoring
kubectl apply -f 1-dc1
kubectl apply -f 2-dc2

kubectl apply -f 3-setup-peering

echo "Cluster building, waiting 2 minutes to get tokens"

echo "dc1: $(kubectl -n consul-dc1 get secrets consul-bootstrap-init-secret --template={{.data.SecretID}} | base64 -d)"
echo "dc2: $(kubectl -n consul-dc2 get secrets consul-bootstrap-init-secret --template={{.data.SecretID}} | base64 -d)"