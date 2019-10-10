# Demo 3: Remediation of Shopping Cart

| [README](/ops20/README.md) | [Slides](/ops20/slides/README.md) | [Demos](/ops20/demos/README.md) | [Deployment](/ops20/deployment/README.md) |
|--------|-------|------------|-----------|

>**Do you need to show videos instead of doing the demo live?:** Below, you'll find "stage-ready" videos that may be used in the event this presentation should be delivered offline.

|  | Video | Description
|--------|-------|-----|
| [Part 1: Azure Dashboard](#part-1-azure-dashboard) | [Link](https://coming.soon) | Demonstrate the Azure Dashboard
| [Part 2: Azure Service Health](#part-2-azure-service-health) | [Link](https://coming.soon) | Demonstrate Azure Service Health
| [Part 3: Application Map](#part-3-application-map) | [Link](https://coming.soon) | Demonstrate Application Map
| [Part 4: Azure Workbook](#part-4-azure-workbook) | [Link](https://coming.soon) | Demonstrate Azure Workbook
| [Part 5: Log Analytics](#part-5-log-analytics) | [Link](https://coming.soon) | Demonstrate Log Analytics
| [Part 6: KQL (Kusto Query Language)](#part-6-kql-kusto-query-language) | [Link](https://coming.soon) | Demonstrate KQL - Kusto Query Language
| [Part 7: Kubernetes](#part-7-kubernetes) | [Link](https://coming.soon) | Demonstrated editing the configmap

**Question:** *What are we trying to demonstrate?*

**Answer:** We are demonstrating several tools within the Azure ecosystem that can help reduce the time to recover from a service disruption.

This demo touches on seven (7) unique products within the Azure ecosystem we will use to "respond" & "remediate" an active "incident".

We will navigate through a number of tools beginning with the Application Dashboard. [Look here for instructions on how to create the dashboard](../../deployment/dashboard/README.md) prior to the demo.

>**Presenter Setup Checklist:**

- [ ] Dashboard created open in own tab.
- [ ] AKS connection string ready to copy and paste.
- [ ] Cloud shell open in tab (can open from troubleshooting guide).

> Be sure all above are complete before beginning demo

## Part 1: Azure Dashboard

>**Presenter Note:** The Dashboard is not created automatically during the deployment. To create the dashboard used in this demonstration, simply press the "Application Dashboard" button found in Application Insights. Be sure to have created this before you begin the presentation. [Full instructions are found here](/deployment/dashboard/README.md)

From the Dashboard, we will explore the following tools: Azure Service Health (**note:** a block needs to be added to the dashboard)

## Part 2: Azure Service Health

## Part 3: Application Map

From the Azure Application Map we should be able to see problems occuring in the connection between the front end of the system and the database.

![](../../media/screenshots/demo03_ApplicationMap.png)

## Part 4: Azure Workbook

Demonstrate the pre-existing `Failure Analysis Workbook`, furthering our understanding that the shopping cart is experiencing trouble. 

## Part 5: Log Analytics

Demonstrate the multiple tables and features of Log Analytics such as the ability to use predefined queries, and save your own.

## Part 6: KQL (Kusto Query Language)

Demonstrate querying any part of the system by manually typing in the following query because we *"want to see all log entries that contain something about the cart"*.

``` KQL
ContainerLog | where LogEntry contains "cart"
```

## Part 7: Kubernetes

In this demo you will need run a few commands from [Cloud Shell](https://shell.azure.com).

The following commands are used to **"fix"** the problem in demo 3.

**Connect to AKS**

To connect to the Kubernetes cluster, run the following:

``` az cli
az aks get-credentials --name <your_cluster_name> --resource-group <your_resource_group> --admin
```

>**Tip:** To find the name of your Kubernetes cluster, browse the Kubernetes service from your Resource Group in the Azure portal. The name displayed in the upper left is **<your_cluster_name>**. Use that in the above command along with the resource group in which it is located to authenticate and connect.

This will authenticate and connect you to the Kubernetes cluster. Next we will view all of the running pods by running the following:

Next we will edit the **configmap** associated with the shopping cart. To do so, run the following:

``` az cli
kubectl edit configmap cfg-my-tt-cart
```

This will open the cfg-my-tt-cart configmap in a **Vi** editor.

---

The **"problem"** with the shopping cart is that the **HOST** address for the backend database is missing a digit.

To **"fix"** this, we will edit the configmap and correct the bad **HOST** address.

From within the **Vi** editor, move the cursor down to the **HOST** field. You'll notice at the end of the URL, the address ends in `:44/`. The correct address should end with port `:443/`

Add the missing `3` to the **HOST** URL by moving over the existing `/` and typing **3**.

Next, press `Escape`, followed by typing `:wq`

This will **w**rite and **q**uit (*:wq*) the editor.

Next, display all running pods in our deployment with:

``` az cli
kubectl get pods
```

This will display all running pods in your Kubernetes cluster.

Look for the pod associated with the shopping cart. It should have **shopping_cart** followed by a string of random characters in the name. Copy the name of the shopping cart.

Next, delete the pod using the following command and the name of your unique shopping cart pod (the one we just copied to your clipboard).

``` az cli
kubectl delete pod <your_shopping_cart_pod>
```

This will delete the current pod and spawn a new one with the corrected configmap and our problem will be resolved.

Errors will stop displaying in the web app.

End of demonstration.
