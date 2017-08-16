wget -O kubernetes-dashboard-no-rbac.yaml https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard-no-rbac.yaml

./kubectl create -f kubernetes-dashboard-no-rbac.yaml

screen -dmS kubectl_proxy bash -c "./kubectl proxy"

curl -vvv http://localhost:8001/ui
