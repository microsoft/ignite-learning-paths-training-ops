# Tailwind OPS LP Deployment

## Azure Subscription

If you are presenting the demonstrations live you will need to access the Azure Portal, which requires an Azure account. If you have not done so already, [sign up for free here](https://portal.azure.com).

## Provider registration

The Tailwind Traders application uses many Azure services. In some cases, if a service has not yet been used in your subscription, a provider registration may be needed. The following commands will ensure your subscription is capable of running the Tailwind Traders application.

```
az provider register --namespace Microsoft.OperationalInsights
az provider register --namespace Microsoft.DocumentDB
az provider register --namespace Microsoft.DBforPostgreSQL
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.Sql
az provider register --namespace Microsoft.ContainerRegistry
```

## Service Principal

You need to provide service principal credentials to the deployment for the Azure Kubernetes Service cluster creation.

*IMPORTANT*: when you create a service principal and provide this information, it is important to be aware that you are creating privledged access in this environment and need to treat that access and the credentials accordingly (more info can be found in the doc below).

For information on creating an Azure Service Principal, see the following documentation:

[Create an Azure Service Principal with Azure CLI](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)

If you have already generated a service principal ID, you do **NOT** need to do it again. Use the same ID and password as before.

The process will look something like this (when run from [Cloud Shell](https://shell.azure.com):

``` az cli
az ad sp create-for-rbac
```

The output should look similar to this:

``` az cli
{
  "appId": "2ddb2923-88c6-45cc-98zz-36717cq35001",
  "displayName": "azure-cli-2019-09-04-17-35-58",
  "name": "http://azure-cli-2019-09-04-17-35-58",
  "password": "3c371136-dafd-4b1f-a793-50885537e9a7",
  "tenant": "72f988bf-86f1-41af-91ab-2d7cd011db47"
}
```

## Deployment

There are two ways to kick off a deployment (pick one).

### Option 1: deploy via the "Deploy to Azure" button

Use this button to deploy the Tailwind Traders application.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fignite-learning-paths-training-ops%2Fmaster%2Fdeployment%2Fazuredeploy.json" target="_blank">
 <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

### Option 2: Deploy via the az command line tool

If you'd prefer to deploy using the az command line tool, you can:

1) create a ```params.json``` file whose contents look like this:

```
{
  "servicePrincipalId": {
          "value": "YOUR_PRINCIPAL_ID"
  },
  "servicePrincipalSecret": {
          "value": "YOUR_PRINCIPLE_SECRET"
  },
  "azureDevOpsOrgName": {
          "value": "NEW_AZDEVOPS_ORG_NAME"
  },
  "emailAddress": {
          "value": "YOUR EMAIL ADDRESS"
  }
}
```

(The servicePrincipal values will be those created in the earlier step in this doc. The azureDevOpsOrgName is the name of a new Azure DevOps organization that will be created to be used in the demo. Do not use an existing Azure DevOps organization name).

2) Create the resource group (choose a new resource group name to put the demo resources in and also which Azure region and subscription you'd like them to run in):

```
az group create --name RESOURCE_GROUP_NAME --location PREFERRED_AZURE_LOCATION --subscription YOUR_SUBSCRIPTION_NAME
```

3) Kick off the deploy:

```
az group deployment create --resource-group RESOURCE_GROUP_NAME --template-uri https://raw.githubusercontent.com/microsoft/ignite-learning-paths-training-ops/master/deployment/azuredeploy.json  --parameters @params.json --subscription YOUR_SUBSCRIPTION_NAME
```

## Connect to deployment

To validate that the deployment has completed, select the Azure Container Instance.

![alt text](./images/aci.jpg)

Select **Containers**. Once the container state has changed from **Running** to **Terminated**, the deployment automation has completed. Select logs.

![alt text](./images/logs.jpg)

Scroll to the bottom of the logs to retrieve both the application URL and the command needed to connect to the Kubernetes cluster.

![alt text](./images/connection.jpg)

## **IMPORTANT:** When you are done

Be sure to delete the resources when you have completed the presentation.

Run the following command from [Cloud Shell](https://shell.azure.com) to delete the entire resource group:

```
az group delete --name <resource group name> --yes --no-wait
```

It will take several minutes, but by deleting the entire resource group, all resources associated with the demo environment will be destroyed.

The Azure DevOps organization also needs to be deleted. This can be done from the settings for the organization.

## Source Repositories

For a deeper understanding of the infrastructure and applications this presentations uses as a demo environment, please reference the following repositories and documentation.

[https://github.com/microsoft/TailwindTraders](https://github.com/microsoft/TailwindTraders)
