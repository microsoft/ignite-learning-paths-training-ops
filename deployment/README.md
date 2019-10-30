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

You need to provide service principal credentials to the deployment for the Azure Kubernetes Service cluster creation. For information on creating an Azure Service Principal, see the following documentation:

[Create an Azure Service Principal with Azure CLI](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)

## Deployment

Use this button to deploy the Tailwind Traders application.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fignite-learning-paths-training-ops%2Fmaster%2Fdeployment%2Fazuredeploy.json" target="_blank">
 <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

## Connect to deployment

To validate that the deployment has completed, select the Azure Container Instance.

![alt text](./images/aci.jpg)

Select **Containers**. Once the container state has changed from **Running** to **Terminated**, the deployment automation has completed. Select logs.

![alt text](./images/logs.jpg)

Scroll to the bottom of the logs to retrieve both the application URL and the command needed to connect to the Kubernetes cluster.

![alt text](./images/connection.jpg)

## Teardown instructions

When done the demo environment can be deleted using the following command:

```
az group delete --name <resource group name> --yes --no-wait
```

The Azure DevOps organization also needs to be deleted. This can be done from the settings for the organization.