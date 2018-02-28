#######################################################
# 1. If neccessary, select Azure RM Subscription
#######################################################
Select-AzureRmSubscription -SubscriptionName "My Internal Subscription" # (1) Change your subscription


#######################################################
# 2. Create or check for existing resource group
#######################################################
$resourceGroupName = "GH-COSMOS-DEMO-KRC-GRP" # (2) Change your resource group
$resourceGroupLocation = "Korea Central" # (3) Change your resource group location

$resourceGroup = Get-AzureRmResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if(!$resourceGroup)
{
    Write-Host "Resource group '$resourceGroupName' does not exist. To create a new resource group, please enter a location." -ForegroundColor Green;
    if(!$resourceGroupLocation) {
        $resourceGroupLocation = Read-Host "resourceGroupLocation";
    }
    Write-Host "Creating resource group '$resourceGroupName' in location '$resourceGroupLocation'" -ForegroundColor Green;
    New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation
}
else{
    Write-Host "Using existing resource group '$resourceGroupName'" -ForegroundColor Green;
}


#################################################
# (3) Create DEMO resources
#################################################
$templateFile = "D:\For Work\Azure\Azure Powershell Scripts\Cosmos\ARMTemplates\CreateCosmosDB-HOL-01\template.json" # (4) Change your template file
$parametersFile = "D:\For Work\Azure\Azure Powershell Scripts\Cosmos\ARMTemplates\CreateCosmosDB-HOL-01\parameters.json" #(5) Change your parameter file

 Write-Host "`nCreating Demo resources ..." -ForegroundColor Green

 New-AzureRmResourceGroupDeployment `
     -ResourceGroupName $resourceGroupName `
     -TemplateFile $templateFile `
     -TemplateParameterFile $parametersFile
