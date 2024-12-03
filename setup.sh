#!/bin/bash
kubectl apply -f 1-dc1/1-Namespace.yaml
kubectl -n consul-dc1 create secret generic consul-licence --from-file=consul.hclic
kubectl apply -f 2-dc2/1-Namespace.yaml
kubectl -n consul-dc2 create secret generic consul-licence --from-file=consul.hclic

kubectl apply -f 0-Monitoring
kubectl apply -f 1-dc1
kubectl apply -f 2-dc2

kubectl apply -f 3-setup-peering

echo ""
echo "To Setup port forwarding use the following"
echo "kubectl -n consul-monitoring port-forward services/grafana-service 3000:80"
echo "kubectl -n consul-dc1 port-forward services/consul 8500:8500"
echo "kubectl -n consul-dc2 port-forward services/consul 8500:8500"

echo ""
echo "Cluster building, waiting 2 minutes to get tokens"

sleep 120

echo "dc1: $(kubectl -n consul-dc1 get secrets consul-bootstrap-init-secret --template={{.data.SecretID}} | base64 -d)"
echo "dc2: $(kubectl -n consul-dc2 get secrets consul-bootstrap-init-secret --template={{.data.SecretID}} | base64 -d)"