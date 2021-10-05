$TenantId = '5c147d8a-3229-4a42-a54e-98b937904e15'
$SubID = 'bad8333d-60e3-47ec-884d-20456f2df201'
$RG = 'cloudTeamGitProject'
$Name = 'Server2019 Deployment'
$Location = 'North Europe'
$TemplateFile = "C:\Users\MehodgeAdmin\OneDrive\Git\cloudTeamGitProject\azuredeploy.json"
$TemplateParameterFile = "C:\Users\MehodgeAdmin\OneDrive\Git\cloudTeamGitProject\azuredeploy.parameters.json"

Connect-AzAccount -TenantId $TenantId -SubscriptionID $SubID

New-AzResourceGroup -Name $RG -Location $Location
New-AzResourceGroupDeployment `
    -Name $Name `
    -ResourceGroupName $RG `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $TemplateParameterFile