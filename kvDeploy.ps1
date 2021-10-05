$TenantId = ''
$SubID = ''
$RG = "Shared-RG"
$Location = "North Europe"
$VaultName = "LocalAdmin-KV"

Connect-AzAccount -TenantId $TenantId -SubscriptionID $SubID

New-AzResourceGroup -Name $RG -Location $Location
New-AzKeyVault `
  -VaultName $VaultName `
  -resourceGroupName $RG `
  -Location $Location `
  -EnabledForTemplateDeployment `
  -Tag @{
	Application="Identity";
	CostCentre="Infrastructure";
	DataClassification="Classified";
	Environment="Production";
	Monitoring="On";
	Owner="Michael Neal";
	Vendor="Mehodge"	  
  }

$secretvalue = ConvertTo-SecureString 'a-password' -AsPlainText -Force
$secret = Set-AzKeyVaultSecret -VaultName $VaultName -Name 'azadmin' -SecretValue $secretvalue `
	-Tag @{
		Application="Identity";
		CostCentre="Infrastructure";
		DataClassification="Classified";
		Environment="Production";
		Monitoring="On";
		Owner="Michael Neal";
		Vendor="Mehodge"
		}

Get-AzKeyVault $VaultName | Select-Object ResourceId
