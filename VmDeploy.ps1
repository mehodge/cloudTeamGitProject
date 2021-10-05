$TenantId = '3176e70d-cb5d-474c-99c6-aecf87bea122'
$SubID = '9d57f0d2-39c5-4cfb-af16-1988037f5cd7'
$RG = 'CA-RG'
$Name = 'CA-Stand1'
$TemplateFile = "C:\Users\mehodgeadmin\OneDrive\Git\WinServerVM-KV\azuredeploy.json"
$TemplateParameterFile = "C:\Users\mehodgeadmin\OneDrive\Git\WinServerVM-KV\azuredeploy.parameters.json"

#Connect-AzAccount -TenantId $TenantId -SubscriptionID $SubID

New-AzResourceGroupDeployment `
    -Name $Name `
    -ResourceGroupName $RG `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $TemplateParameterFile