# consul-admin-partition-testing
Simple Admin Partition example

### Enterprise License Key

```bash
kubectl apply -f 1-Standard/1-Namespace.yaml
kubectl -n consul-dc1 create secret generic consul-licence --from-file=consul.hclic
```


## To run
```bash
kubectl apply -f 0-Monitoring
kubectl apply -f 1-Standard
```

## To Access Monitoring
```bash
kubectl -n consul-monitoring port-forward services/grafana-service 3000:80
```

## Get Root Token
```bash
kubectl -n consul-dc1 get secrets consul-bootstrap-init-secret --template={{.data.SecretID}} | base64 -d
```


## To Access Consul
```bash
kubectl -n consul-dc1 port-forward services/consul 8500:8500
```

[http://127.0.0.1:8500](http://127.0.0.1:8500)


## To TearDown
```bash
kubectl delete -f 1-Standard
kubectl delete -f 0-Monitoring
```

---

## ACL Bootstrap Process
This is for reference, this should be performed automatic so is not required to run by hand. 

```bash
consul acl bootstrap
consul acl bootstrap -format=json
```