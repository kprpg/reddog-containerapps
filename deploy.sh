# *nix only
export RG="rgKontApps"
export LOCATION="southcentralus"
export SUB_ID="0c378775-d18a-45bb-b426-3627de556dd1"

# Follow Azure CLI prompts to authenticate to your subscription of choice
az login
az login --use-device-code
az account set --subscription $SUB_ID

# Create resource group
az group create -n $RG -l $LOCATION

# Deploy all infrastructure and reddog apps
az deployment group create -n reddog -g $RG -f ./deploy/bicep/main.bicep

# Show outputs for bicep deployment
az deployment group show -n reddog -g $RG -o json --query properties.outputs.urls.value