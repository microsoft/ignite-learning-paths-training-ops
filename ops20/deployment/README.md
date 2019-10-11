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

Part of the demo environment uses Kubernetes.

As a result, a service principal is required in order to provision all of the necessary pieces of infrastructure.

If you have already generated a service principal ID, you do **NOT** need to do it again. Use the same ID and password as before.

If you have never created a service principal, run the following command from [Cloud Shell](https://shell.azure.com):

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

>See [az ad sp create-for-rbac](https://docs.microsoft.com/en-us/cli/azure/ad/sp?WT.mc_id=none-github-nepeters&view=azure-cli-latest#az-ad-sp-create-for-rbac) for more information.

## Demo Environment Deployment Instructions

### Automated Deployment

Once you have your service principal information created and available to copy and paste, you may deploy the demo environment used for *OPS20 - Responding To Incidents*, simply by pressing the blue "*Deploy to Azure*" button below.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fneilpeterson%2Ftailwind-reference-deployment%2Fmaster%2Fdeployment-artifacts-aks%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

[Video of the process is available here](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/00_Deployment.mp4)

---

## Post-Deployment Steps

- Authenticate your accounts inside the `teams` and `visualstudioteamservices` API Connection types listed in the new Resource Group
-  Verify the Azure Function URL (Statuspage) is loading
- Create the Application Dashboard by going to Application Insights and pressing the button that says `Application Dashboard`
- Open your new Azure Devops Project (not the Organization) and verify everything worked
- Highlight and copy the name of the Kubernetest service. We'll use this to connect to the cluster and make changes
- Check each of the Logic Apps and make sure they aren't requiring authentication
- Create Troubleshooting Guide using [template found here](../demos/02/TroubleshootingGuide_ARM_Template.json)
- Copy HTTP Endpoint URL from main Logic App and paste in to Postman 
- [Setup webhook for Statuspage function](statuspage/README.md)
- [Break the shopping cart](break_tailwindtraders/README.md)

That's all we need to take care of for now.

---

## **IMPORTANT:** When you are done

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
