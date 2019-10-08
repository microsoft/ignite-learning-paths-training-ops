# Demo 3: Remediation of Shopping Cart

[Watch the stage ready demonstration](https://coming.soon)

**Q: What are we trying to demonstrate?**

**A: We are demonstrating several tools within the Azure ecosystem that can help reduce the time to recover from a service disruption.**

**Summary of demo**:
Blah, blah

*This demo uses the following:*

1. [Azure Dashboard](/tools/README.md)
2. [Azure Service Health](/tools/README.md)
3. [Application Map](/tools/README.md)
4. [Azure Workbook](/tools/README.md)
5. [Log Analytics](/tools/README.md)
6. [KQL](/tools/README.md#KQL)
7. [Kubernetes](/tools/README.md#Kubernetes)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide60.png)

In this demo you will need run a few commands from [Cloud Shell](https://shell.azure.com).

The following commands are used to **"fix"** the problem in demo 3.

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
