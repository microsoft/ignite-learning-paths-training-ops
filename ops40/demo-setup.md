# OPS40 Demo Setup

First, deploy the Tailwind Traders application onto a Kubernetes cluster. Deployment steps and automation can be found here:

[https://github.com/microsoft/ignite-learning-paths-training-ops/tree/master/deployment](https://github.com/microsoft/ignite-learning-paths-training-ops/tree/master/deployment)

Once completed, fork this repo into your own GitHub account and clone to your development system.

[https://github.com/microsoft/ignite-learning-paths-training-ops.git](https://github.com/microsoft/ignite-learning-paths-training-ops.git)

Update the variable values in the `/ops40/demos/azure_pipeline/azure-pipelines.yaml` file to match the new Azure Container Registry, Azure Kubernetes Service, and Cosmos DB deployments.

**Azure Container Registry (ACR)**

On lines 13 and 14, replace the container registry name and FQDN. You can get these values with the following Azure CLI command.

```
$ az acr list -o table

NAME                RESOURCE GROUP         LOCATION    SKU       LOGIN SERVER                   CREATION DATE         ADMIN ENABLED
------------------  ---------------------  ----------  --------  -----------------------------  --------------------  ---------------
ttacrfqkz63c47hsxc  ops40-demo-update-002  eastus2     Standard  ttacrfqkz63c47hsxc.azurecr.io  2019-11-06T23:00:52Z  True
```

**Azure Kubernetes Service (AKS)**

On line 17, 18, 19, replace the aks cluster, resource group name, and ingress controller FQDN for the **pre-production** cluster.

On line 22, 23, 25 replace the aks cluster, resource group name, and ingress controller FQDN for the **production** cluster.

For the sake of this demo, it is ok to use the same cluster for both pre-production and production. If doing so, the values will be identical.

You can get the AKS cluster name and resource group name with the following Azure CLI command.

```
$ az aks list -o table

Name                             Location    ResourceGroup          KubernetesVersion    ProvisioningState    Fqdn
-------------------------------  ----------  ---------------------  -------------------  -------------------  --------------------------------------------------------------
tailwindtradersaksfqkz63c47hsxc  eastus2     ops40-demo-update-002  1.14.7               Succeeded            tailwindtradersaksfqkz63c47hsxc-e4b70ded.hcp.eastus2.azmk8s.io
```

Run the following `kubectl` command to get the ingress controller fqdn (host).

```
$ kubectl get ingress

NAME                                       HOSTS                                    ADDRESS       PORTS   AGE
my-tt-cart-cart-api                        0308a1246be6400d8ba5.eastus2.aksapp.io   20.186.2.74   80      16d
my-tt-coupon-tt-coupons                    0308a1246be6400d8ba5.eastus2.aksapp.io   20.186.2.74   80      16d
my-tt-image-classifier                     0308a1246be6400d8ba5.eastus2.aksapp.io   20.186.2.74   80      16d
my-tt-login                                0308a1246be6400d8ba5.eastus2.aksapp.io   20.186.2.74   80      16d
my-tt-mobilebff                            0308a1246be6400d8ba5.eastus2.aksapp.io   20.186.2.74   80      16d
my-tt-popular-product-tt-popularproducts   0308a1246be6400d8ba5.eastus2.aksapp.io   20.186.2.74   80      16d
my-tt-product-tt-products                  0308a1246be6400d8ba5.eastus2.aksapp.io   20.186.2.74   80      16d
my-tt-profile                              0308a1246be6400d8ba5.eastus2.aksapp.io   20.186.2.74   80      16d
my-tt-stock                                0308a1246be6400d8ba5.eastus2.aksapp.io   20.186.2.74   80      16d
my-tt-webbff                               0308a1246be6400d8ba5.eastus2.aksapp.io   20.186.2.74   80      16d
web                                        0308a1246be6400d8ba5.eastus2.aksapp.io   20.186.2.74   80      16d
```

**Cosmos DB**

On line 27, replace the Cosmos DB name with shopping cart Cosmos DB endpoint. You can get this value with the following AZ command. Select the `DocumentEndpoint` for the instance with a prefix of `https://ttshoppingdb`.

```
$ az cosmosdb list -o table

DatabaseAccountOfferType    DocumentEndpoint                                            EnableAutomaticFailover    EnableMultipleWriteLocations    IpRangeFilter    IsVirtualNetworkFilterEnabled    Kind              Location    Name                       ProvisioningState    ResourceGroup
--------------------------  ----------------------------------------------------------  -------------------------  ------------------------------  ---------------  -------------------------------  ----------------  ----------  -------------------------  -------------------  ---------------------
Standard                    https://ttshoppingdbfqkz63c47hsxc.documents.azure.com:443/  False                      True                                             False                            GlobalDocumentDB  East US 2   ttshoppingdbfqkz63c47hsxc  Succeeded            ops40-demo-update-002
```

Once done, push the updates back to GitHub. This repository is used in the next two steps for creating an Azure Pipeline.

## Create Azure Pipeline service connection

1. Navigate to the new Azure DevOps organization, and then the new DevOps project.

2. Select **Project settings** > **Service connections** > **New service connection** > **Azure Resource Manager**.

3. Enter a connection name of `azure-service-connection`, select the appropriate Azure subscription, and select **OK**.

## Import and run the pipeline

1. Select **Pipelines** on the left hand Azure DevOps menu.

2. If prompted, select **Try it!** to enable the new unified YAML pipeline experience.

3. Select **Create Pipeline**.

4. Select **GitHub YAML** and then select the **ignite-learning-paths-training-ops** repo fork. You should have created this repo during set up.

5. Select **Existing Azure Pipelines YAML file** for the project type.

6. Browse the repository and select the **azure-pipelines.yml** file.

7. Select **Continue** to create the pipeline.

8. Click **Run** to save and run the pipeline.

If the pipeline runs successfully, move onto the next step. If not, you will need to troubleshoot.

## Create a manual check

1. Click on **Environments** on the left hand Azure DevOps menu.

2. Select the **Production** environment.

3. Select the **...** menu > **Approvals and Checks** > **Approvals**.

4. Add yourself as an approver and select **create**.

## Break Tailwind Traders

This step is optional. All demos work fine without this step, it is cool to include for effect.

1. Edit the configmap for the TWT cart api:

```
kubectl edit configmap cfg-my-tt-cart
```

2. Update the `HOST` value so that it is not valid. In the following example, I have removed `https` from the URL. Once done save the configmap.

```
HOST: ://ttshoppingdbt6grppp3eluvk.documents.azure.com:443/
```

3. The cart pod needs to be recreated, which will take in the new value and effectively break the Tailwind cart. Return a list of pods

```
$ kubectl get pods

NAME                                                        READY   STATUS    RESTARTS   AGE
my-tt-cart-cart-api-dcc6568fc-9z655                         1/1     Running   0          5h3m
my-tt-coupon-tt-coupons-85c96964fc-lhvl7                    1/1     Running   0          16d
my-tt-image-classifier-7d6d97875f-6xhmz                     1/1     Running   0          16d
my-tt-login-7f88cff49-j6k6f                                 1/1     Running   0          16d
my-tt-mobilebff-67dcb9f988-mf5xn                            1/1     Running   0          16d
my-tt-popular-product-tt-popularproducts-67dfcc8b67-bw8dq   1/1     Running   0          16d
my-tt-product-tt-products-d9c54d955-97b8n                   1/1     Running   0          16d
my-tt-profile-5c57bf89b4-fdzfc                              1/1     Running   0          16d
my-tt-stock-6b969dd459-2mm6g                                1/1     Running   0          16d
my-tt-webbff-67849c78b7-n4t22                               1/1     Running   0          16d
web-6b56cc7d7c-xnhvz                                        1/1     Running   0          16d
```

4. Delete the `my-tt-cart` pod:

```
kubectl delete pod my-tt-cart-cart-api-7d964dbffc-749lt
```

## Prepare browser

Open a browser with a tab for each of these:

1. Tailwind traders application - here you show that the cart API is non-functional.
2. Forked GitHub repository - here you create a pull request and demonstrate the test automation results.
3. Azure DevOps project - here you show the DevOps project and the pipeline execution overview.
4. YAML pipeline - here you show the pipeline YAML. I've found having the overview in one tab (item above this), and the YAML in another makes for a nice back and forth experience.
5. Azure Container Registry - here you show the container image version number (demonstrate tracing from an Azure resource)e following commands can be used to find these values.
