$TenantId = ''
$SubID = ''
$RG = 'cloudTeamGitProject'
$Name = 'Server2019-Deployment'
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
