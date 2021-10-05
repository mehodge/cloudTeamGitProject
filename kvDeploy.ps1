$TenantId = '5c147d8a-3229-4a42-a54e-98b937904e15'
$SubID = 'bad8333d-60e3-47ec-884d-20456f2df201'
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

$secretvalue = ConvertTo-SecureString 'y6f_j($/r+]>-e7AJ+;:2bM#Z' -AsPlainText -Force
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