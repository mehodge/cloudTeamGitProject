$RG = "Shared-RG"
$Location = "North Europe"
$VaultName = "LocalAdmin-KV"


New-AzResourceGroup -Name $RG -Location $Location
New-AzKeyVault `
  -VaultName $VaultName `
  -resourceGroupName $RG `
  -Location $Location `
  -EnabledForTemplateDeployment

$secretvalue = ConvertTo-SecureString 'y6f_j($/r+]>-e7AJ+;:2bM#Z' -AsPlainText -Force
$secret = Set-AzKeyVaultSecret -VaultName $VaultName -Name 'azadmin' -SecretValue $secretvalue `
	-Tag @{
		Application="Identity" `
		CostCentre="Infrastructure" `
		DataClassification="Classified" `
		Environment="Production" `
		Monitoring="On" `
		Owner="Michael Neal" `
		Vendor="Mehodge" `
		}

Get-AzKeyVault $VaultName | Select-Object ResourceId