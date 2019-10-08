# Breaking Tailwind Traders

In order to demonstrate certain aspects of incident management, including the use of observability tools such as Log Analytics, Troubleshooting Guides, KQL, and more, we will need to artificially cause problems in our Tailwind Traders e-commerce site.

For this demonstration we have chosen to put the system in a state where the Kubernetes pod associated with the shopping cart functionality of the site is using a configuration file with a bad URL. The **HOST** address is missing a `3` digit in the port `:443` portion of the URL.

To "break" the site we need to first authenticate and connect to the Kubernetes cluster.

To do so, run the following from [Cloud Shell](https://shell.azure.com)

``` az cli
az aks get-credentials --name <your_kubernetes_cluster_name> --resource-group <your_resource_group> --admin
```

## Edit the configmap

Once you are connected, we will then run: 

``` az cli
kubectl edit configmap cfg-my-tt-cart
```

This will open the **cfg-my-tt-cart** configmap in the **Vi** editor.

From within the **Vi** editor, move the cursor down to the **HOST** field. You'll notice at the end of the URL, the address ends in `:44/`. The correct address should end with port `:443/`

Add the missing `3` to the **HOST** URL by moving over the existing `/` and typing **3**.

Next, press `Escape`, followed by typing `:wq`

This will **w**rite and **q**uit (*:wq*) the editor.

## View all running pods

Next, display all running pods in our deployment with:

``` az cli
kubectl get pods
```

This will display all running pods in your Kubernetes cluster.

Look for the pod associated with the shopping cart. It should have **shopping_cart** followed by a string of random characters in the name. Copy the name of the shopping cart.

## Delete shopping cart pod

Next, delete the pod using the following command and the name of your unique shopping cart pod (the one we just copied to your clipboard).

``` az cli
kubectl delete pod <your_shopping_cart_pod>
```

This will delete the current pod and spawn a new one with the **BAD** configmap and our problem will begin.

Errors will begin displaying in the web app.

We are now ready for the demonstration.
