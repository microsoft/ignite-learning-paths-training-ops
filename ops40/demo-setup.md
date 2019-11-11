# OPS40 Demo Setup

First, deploy the Tailwind Traders application onto a Kubernetes cluster. Deployment steps and automation can be found here:

https://github.com/microsoft/ignite-learning-paths-training-ops/tree/master/deployment

Once completed, fork this repo into your own GitHub account and clone to your development system.

https://github.com/microsoft/ignite-learning-paths-training-ops.git

Update the values in the `/ops40/demos/azure_pipeline/azure-pipelines.yaml` file to match the AKS and ACR deployments. The following commands can be used to find these values.

```
az acr list -o table
az aks list -o table
```

Once done, push the updates back to GitHub. This file is used in demo 1 when creating an Azure Pipeline.

## Create Azure Pipeline Service Connection

This step was originally part of the demo however can take a few minutes to complete. To expedite the process I recommend configuring the service connection before starting the demo.

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

## Optional: Break Tailwind Traders

If you would like to break the Tailwind app and show remediation using an Azure DevOps pipeline, here is a quick way to do so.

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
my-tt-cart-7cd4cbd744-j6ngl                                 1/1     Running   0          18m
my-tt-coupon-tt-coupons-85c96964fc-4r9zn                    1/1     Running   0          19m
my-tt-image-classifier-7d6d97875f-f8sjp                     1/1     Running   0          18m
my-tt-login-7f88cff49-5d876                                 1/1     Running   0          19m
my-tt-mobilebff-67dcb9f988-w6xjr                            1/1     Running   0          18m
my-tt-popular-product-tt-popularproducts-67dfcc8b67-qx5fg   1/1     Running   0          19m
my-tt-product-tt-products-d9c54d955-z8nf4                   1/1     Running   0          19m
my-tt-profile-5c57bf89b4-zjqdf                              1/1     Running   0          19m
my-tt-stock-6b969dd459-zptrz                                1/1     Running   0          19m
my-tt-webbff-67849c78b7-bjd5n                               1/1     Running   0          18m
web-6b56cc7d7c-ws7v4                                        1/1     Running   0          18m
```

Delete the `my-tt-cart` pod:

```
kubectl delete pod my-tt-cart-7cd4cbd744-j6ngl
```