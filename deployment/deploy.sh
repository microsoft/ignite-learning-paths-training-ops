#!/bin/bash
set -e

# Credentials
azureClientID=$CLIENT_ID
azureClientSecret=$SECRET
sqlServePassword=Password2020!

# Azure and container image location
azureResourceGroup=$RESOURCE_GROUP_NAME
containerRegistry=neilpeterson
containerVersion=v2

# Tailwind deployment
tailwindCharts=TailwindTraders-Backend/Deploy/helm
tailwindChartValuesScript=ignite-learning-paths-training-ops/deployment/helm-values/generate-config.ps1
tailwindChartValues=/values.yaml
tailwindWebImages=TailwindTraders-Backend/Deploy/tt-images
tailwindServiceAccount=TailwindTraders-Backend/Deploy/helm/ttsa.yaml

# Print out tail command
echo "*************** Container logs ***************"
echo "az container logs --name bootstrap-container --resource-group $azureResourceGroup --follow"
echo "*************** Connection Information ***************"

# Application Insights (using preview extension)
az extension add -n application-insights
instrumentationKey=$(az monitor app-insights component show --app tt-app-insights --resource-group $azureResourceGroup --query instrumentationKey -o tsv)

# Get backend code
echo "*************** Cloning Tailwind code repository ***************"

git clone https://github.com/microsoft/TailwindTraders-Backend.git
git -C TailwindTraders-Backend checkout ed86d5f

# Create postgres DB, Disable SSL, and set Firewall
echo "*************** Create stockdb Postgres database. ***************"

POSTGRES=$(az postgres server list --resource-group $azureResourceGroup --query [0].name -o tsv)
az postgres db create -g $azureResourceGroup -s $POSTGRES -n stockdb
az postgres server update --resource-group $azureResourceGroup --name $POSTGRES --ssl-enforcement Disabled
az postgres server firewall-rule create --resource-group $azureResourceGroup --server-name $POSTGRES --name AllowAllAzureIps --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0

# Install Helm on Kubernetes cluster
echo "*************** Installing Tiller on Kubernets cluster. ***************"

AKS_CLUSTER=$(az aks list --resource-group $azureResourceGroup --query [0].name -o tsv)
az aks get-credentials --name $AKS_CLUSTER --resource-group $azureResourceGroup --admin
kubectl apply -f https://raw.githubusercontent.com/Azure/helm-charts/master/docs/prerequisities/helm-rbac-config.yaml
helm init --wait --service-account tiller

# Create Kubernetes Service Account
echo "*************** Create Helm service account in Kubernetes. ***************"

kubectl apply -f $tailwindServiceAccount

# Create Helm values file
echo "*************** Create Helm values file.. ***************"
pwsh $tailwindChartValuesScript -resourceGroup $azureResourceGroup -sqlPwd $sqlServePassword -outputFile $tailwindChartValues

# Deploy application to Kubernetes
echo "*************** Deplpying applications to Kubernetes. ***************"

INGRESS=$(az aks show -n $AKS_CLUSTER -g $azureResourceGroup --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName -o tsv)
pictures=$(az storage account list -g $azureResourceGroup --query [0].primaryEndpoints.blob -o tsv)

# Backend
helm install --name my-tt-login -f $tailwindChartValues --set ingress.hosts={$INGRESS} --set image.repository=$containerRegistry/login.api --set image.tag=$containerVersion --set inf.storage.profileimages=${pictures}profiles-list $tailwindCharts/login-api
helm install --name my-tt-product -f $tailwindChartValues --set ingress.hosts={$INGRESS} --set image.repository=$containerRegistry/product.api --set image.tag=$containerVersion --set inf.storage.productimages=${pictures}product-list --set inf.storage.productdetailimages=${pictures}product-detail $tailwindCharts/products-api
helm install --name my-tt-coupon -f $tailwindChartValues --set ingress.hosts={$INGRESS} --set image.repository=$containerRegistry/coupon.api --set image.tag=$containerVersion --set inf.storage.couponimage=${pictures}coupon-list $tailwindCharts/coupons-api
helm install --name my-tt-profile -f $tailwindChartValues --set ingress.hosts={$INGRESS} --set image.repository=$containerRegistry/profile.api --set image.tag=$containerVersion --set inf.storage.profileimages=${pictures}profiles-list $tailwindCharts/profiles-api
helm install --name my-tt-popular-product -f $tailwindChartValues --set ingress.hosts={$INGRESS} --set image.repository=$containerRegistry/popular-product.api --set image.tag=$containerVersion --set initImage.repository=$containerRegistry/popular-product-seed.api --set initImage.tag=latest --set inf.storage.productimages=${pictures}product-list $tailwindCharts/popular-products-api
helm install --name my-tt-stock -f $tailwindChartValues --set ingress.hosts={$INGRESS} --set image.repository=$containerRegistry/stock.api --set image.tag=$containerVersion $tailwindCharts/stock-api
helm install --name my-tt-image-classifier -f $tailwindChartValues --set ingress.hosts={$INGRESS} --set image.repository=$containerRegistry/image-classifier.api --set image.tag=$containerVersion $tailwindCharts/image-classifier-api
helm install --name my-tt-cart -f $tailwindChartValues --set ingress.hosts={$INGRESS} --set image.repository=$containerRegistry/cart.api --set image.tag=$containerVersion $tailwindCharts/cart-api
helm install --name my-tt-mobilebff -f $tailwindChartValues --set ingress.hosts={$INGRESS} --set image.repository=$containerRegistry/mobileapigw --set image.tag=$containerVersion --set probes.readiness=null $tailwindCharts/mobilebff
helm install --name my-tt-webbff -f $tailwindChartValues --set ingress.hosts={$INGRESS} --set image.repository=$containerRegistry/webapigw --set image.tag=$containerVersion $tailwindCharts/webbff

# Website
git clone https://github.com/neilpeterson/TailwindTraders-Website.git
helm install --name web -f TailwindTraders-Website/Deploy/helm/gvalues.yaml --set ingress.protocol=http --set ingress.hosts={$INGRESS} --set image.repository=$containerRegistry/web --set image.tag=v1 TailwindTraders-Website/Deploy/helm/web/

# Copy website images to storage
echo "*************** Copy website images to storage. ***************"

AZURE_STORAGE_ACCT=$(az storage account list -g $azureResourceGroup -o table --query [].name -o tsv)
BLOB_ENDPOINT=$(az storage account list -g $azureResourceGroup --query [].primaryEndpoints.blob -o tsv)
CONNECTION_STRING=$(az storage account show-connection-string -n $AZURE_STORAGE_ACCT -g $azureResourceGroup -o tsv)
az storage container create --name "coupon-list" --public-access blob --connection-string $CONNECTION_STRING
az storage container create --name "product-detail" --public-access blob --connection-string $CONNECTION_STRING
az storage container create --name "product-list" --public-access blob --connection-string $CONNECTION_STRING
az storage container create --name "profiles-list" --public-access blob --connection-string $CONNECTION_STRING
az storage blob upload-batch --destination $BLOB_ENDPOINT --destination coupon-list  --source $tailwindWebImages/coupon-list --account-name $AZURE_STORAGE_ACCT
az storage blob upload-batch --destination $BLOB_ENDPOINT --destination product-detail --source $tailwindWebImages/product-detail --account-name $AZURE_STORAGE_ACCT
az storage blob upload-batch --destination $BLOB_ENDPOINT --destination product-list --source $tailwindWebImages/product-list --account-name $AZURE_STORAGE_ACCT
az storage blob upload-batch --destination $BLOB_ENDPOINT --destination profiles-list --source $tailwindWebImages/profiles-list --account-name $AZURE_STORAGE_ACCT

# Create oncall table
echo "*************** Creating oncall storage table. ***************"

export AZURE_STORAGE_KEY=$(az storage account keys list -n $AZURE_STORAGE_ACCT -g $azureResourceGroup --query [0].value -o tsv)
export AZURE_STORAGE_ACCT=$AZURE_STORAGE_ACCT
export EMAIL=$EMAIL
apt-get update -y
apt-get -y install python3-pip
pip3 install azure.cosmosdb.table
python3 ignite-learning-paths-training-ops/deployment/azure-table.py

# Notes
echo "*************** Connection Information ***************"
echo "The Tailwind Traders Website can be accessed at:"
echo "http://$INGRESS"
echo ""
echo "Run the following to connect to the AKS cluster:"
echo "az aks get-credentials --name $AKS_CLUSTER --resource-group $azureResourceGroup --admin"
echo "******************************************************"