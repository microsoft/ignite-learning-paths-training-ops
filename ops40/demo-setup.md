# OPS40 Demo Setup

First, deploy the Tailwind Traders application onto a Kubernetes cluster. Deployment steps and automation can be found here:

https://github.com/microsoft/ignite-learning-paths-training-ops/tree/master/deployment

Once completed, fork this repo into your own GitHub account and clone to your development system.

https://github.com/microsoft/ignite-learning-paths-training-ops.git

Update the values in the `/ops40/demos/azure_pipeline/azure-pipelines.yaml` file to match the AKS and ACR deployments. Th# OPS40 Demo Setup

```
az acr list -o table
az aks list -o table
```

Once done, push the updates back to GitHub. This repository is used in the next two steps for creating an Azure Pipeline.

## Create Azure Pipeline Service Connection

1. Navigate to the new Azure DevOps organization, and then the new DevOps project.

2. Select **Project settings** > **Service connections** > **New service connection** > **Azure Resource Manager**.

3. Enter a connection name of `azure-service-connection`, select the appropriate Azure subscription, and select **OK**.

## Import and run the pipeline

1. Select **Pipelines** from the left hand Azure DevOps menu.

2. If prompted, select **Try it!** to enable the new unified YAML pipeline experience.

3. Select **Create Pipeline**.

4. Select **GitHub YAML** and then select the **ignite-learning-paths-training-ops** repo fork. You should have created this repo during set up.

5. Select **Existing Azure Pipelines YAML file** for the project type.

6. Browse the repository and select the **azure-pipelines.yml** file.

7. Select **Continue** to create the pipeline.

8. Click **Run** to save and run the pipeline.

If the pipeline runs successfully, move onto the next step. If not, you will need to troubleshoot.

## Create manual check

## Break Tailwind Traders

Edit the configmap for the TWT cart api:

```
kubectl edit configmap cfg-my-tt-cart
```

Update the `HOST` value so that it is not valid. In the following example, I have removed `https` from the URL. Once done save the configmap.

```
HOST: ://ttshoppingdbt6grppp3eluvk.documents.azure.com:443/
```

Next, the cart pod needs to be restarted, which will take in the new value and effectively break the Tailwind cart.

Return a list of pods

```
$ kubectl get pods

NAME                                                        READY   STATUS    RESTARTS   AGE
my-tt-cart-cart-api-7d964dbffc-749lt                        1/1     Running   0          24m
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

Delete the `my-tt-cart` pod:

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