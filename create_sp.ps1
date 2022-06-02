$SPName = 'svc-ansible-azure'
$ResourceGroup = (Get-AzResourceGroup).ResourceGroupName
$SubID = (az account list | ConvertFrom-Json).id
$CredInfo = az ad sp create-for-rbac --name "$($SPName)" --role owner --scope "/subscriptions/$($SubID)/resourceGroups/$($ResourceGroup)" | ConvertFrom-Json

"Create an AAP cred of type 'Microsoft Azure Resource Manager'

Subscription ID: $($SubID)
Username: Leave blank
Password: Leave blank
Client ID: $($CredInfo.appId)
Client Secret: $($CredInfo.password)
Tenant ID: $($CredInfo.tenant)
Azure Cloud Environment: Leave blank"
