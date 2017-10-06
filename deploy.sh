az login

az group deployment create --name doacskube --mode Complete --template-file /host/azureContainerServices.json --parameters @/host/armdeploy-params.json --verbose -g doacskube