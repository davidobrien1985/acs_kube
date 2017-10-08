az login

az group create --name acs-k8s-demo --location australiasoutheast
az group deployment create -g acs-k8s-demo --name acs-k8s-keyvault --mode Incremental --template-file armdeploy-keyvault.json --verbose
az group deployment create -g acs-k8s-demo --name acs-k8s --mode Incremental --template-file azureContainerServices.json --parameters @azuredeploy.parameters.json --verbose





az acs kubernetes install-cli
az acs kubernetes get-credentials -n containerservice-acs-k8s-demo -g acs-k8s-demo --file ~/kubeconfig-acs-k8s-demo --ssh-key-file ~/.ssh/acs_kube
az acs kubernetes browse -n containerservice-acs-k8s-demo -g acs-k8s-demo --ssh-key-file ~/.ssh/acs_kube


# open browser on http://127.0.0.1:8001/ui

kubectl get nodes --server localhost:8001
kubectl apply -f k8s-pods/grafana.yaml --server localhost:8001
kubectl --server localhost:8001 describe service grafana
kubectl --server localhost:8001 describe deployment grafana
kubectl --server localhost:8001 get pod grafana
kubectl --server localhost:8001 describe pod grafana
cat k8s-pods/grafana.yaml | kubectl delete -f - --server localhost:8001
kubectl --server localhost:8001 rolling-update grafana -f k8s-pods/grafana.yaml