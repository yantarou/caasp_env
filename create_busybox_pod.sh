./kubectl create -f busybox.yaml
./kubectl get pods busybox
./kubectl exec busybox cat /etc/resolv.conf
./kubectl exec -ti busybox -- nslookup kubernetes.default
