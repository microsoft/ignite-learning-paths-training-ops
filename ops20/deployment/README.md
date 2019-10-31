# OPS20 (Tailwind Traders AKS Deployment)

| [README](/ops20/README.md) | [Slides](/ops20/slides/README.md) | [Demos](/ops20/demos/README.md) | [Deployment](/ops20/deployment/README.md)
|--------|-------|------------|------|

## Prerequisites

To present **OPS20 - Responding to Incidents**, you'll need an account with the following services.

- Microsoft Azure
- Microsoft Teams

### Azure Subscription

If you are presenting the demonstrations live you will need to access the Azure Portal, which requires an Azure account. If you have not done so already, [sign up for free here](https://portal.azure.com).

### Microsoft Teams

You will also be demonstrating functionality from within Microsoft Teams. If you do not have an account, [sign up for one here](https://teams.microsoft.com/start).

### Postman

To send an alert to the Logic App used in Demo 1, requires sending a JSON payload to a URL. This is accomplished easily using the Postman tool.[ Windows and Mac versions are both avaiable](https://www.getpostman.com/downloads/).

This or similar tool is recommended for the first demonstration. 

---

### Service Principal Requirement

Please read the following link for information regarding service principals. You will be prompted for this information in the next step.

>See [az ad sp create-for-rbac](https://docs.microsoft.com/en-us/cli/azure/ad/sp?WT.mc_id=none-github-nepeters&view=azure-cli-latest#az-ad-sp-create-for-rbac) for more information.

## Demo Environment Deployment Instructions

Please follow the [instructions to deploy this environment found here](../../deployment/README.md).

- [Video of the process is available here](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/TTT_DirectorsCut.mp4)

---

## Post-Deployment Steps

Once the Tailwind Traders demo environment has finished deploying, return here and [follow the instructions found in the post-deployment.md](/ops20/deployment/post-deployment.md).

---

## **IMPORTANT:** When you are done with the demo and presentation

Be sure to delete the resources when you have completed the presentation.

Run the following command from [Cloud Shell](https://shell.azure.com) to delete the entire resource group.

``` az cli
az group delete --name <resource group name> --yes --no-wait
```

It will take several minutes, but by deleting the entire resource group, all resources associated with the demo environment will be destroyed.

---

## Having Trouble?

### Provider registration

The Tailwind Traders application uses many Azure services. In some cases, if a service has not yet been used in your subscription, a provider registration may be needed. The following commands will ensure your subscription is capable of running the Tailwind Traders application.

``` az cli
az provider register --namespace Microsoft.OperationalInsights
az provider register --namespace Microsoft.DocumentDB
az provider register --namespace Microsoft.DBforPostgreSQL
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.Sql
az provider register --namespace Microsoft.ContainerRegistry
```

---

## Source Repositories

For a deeper understanding of the infrastructure and applications this presentations uses as a demo environment, please reference the following repositories and documentation.

https://github.com/microsoft/TailwindTraders

https://github.com/neilpeterson/TailwindTraders-Backend

https://github.com/neilpeterson/TailwindTraders-Website
