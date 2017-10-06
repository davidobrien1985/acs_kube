$rgName = "acs-kube-keyvault"
$location = "australiasoutheast"
$tags = @{Name="acs-kube"}


Login-AzureRmAccount
New-AzureRmResourceGroup -Name $rgName -Location $location -Verbose -Tag $tags
New-AzureRmResourceGroupDeployment -Name $rgName -ResourceGroupName $rgName -Mode Incremental -DeploymentDebugLogLevel All -TemplateFile .\armdeploy-keyvault.json -Verbose