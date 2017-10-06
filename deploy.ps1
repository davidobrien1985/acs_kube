#Login-AzureRmAccount

$rgName = 'doacskube'

New-AzureRmResourceGroup -Name $rgName -Location australiasoutheast -Verbose -Force

New-AzureRmResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile .\armdeploy.json -TemplateParameterFile .\armdeploy-params.json -Mode Complete -Verbose -Force
