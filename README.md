# consul-admin-partition-testing
Simple Admin Partition example

## To run
```bash
kubectl apply -f 0-Monitoring
kubectl apply -f 1-Standard
```

## To Access
```bash
kubectl -n consul-dc1 port-forward services/consul 8500:8500
```

[http://127.0.0.1:8500](http://127.0.0.1:8500)

## To Enable ACL
```bash
consul acl bootstrap
```

## To TearDown
```bash
kubectl delete -f 1-Standard
kubectl delete -f 0-Monitoring
```
