## Demo 1

### Browser Tab 1: Tailwind Traders

Show the Tailwind Traders application and non-functioning cart.

### Browser Tab 2: GitHub Repository

- Create a pull request from branch < a > to the master branch. 
- Once the pull request has been created, stay on the pull request and show that the unit tests are passed through to source control.

### Browser Tab 3: Azure Pipeline Overview

- Expand each stage of the pipeline, give an overview of stages and jobs
- x
- y

### Browser Tab 4: YAML Pipeline

- a
- b
- c

## Demo 2

At this point, hopefully, the pre-production deployment has completed. Show how production can be reconciled .via build ID (helm release version and container image version).

### Browser Tab 3: Azure Pipeline Overview

Get the latest build id, this can be seen in the last runs URL.

![Pipeline Run URL with Build ID](./images/buildid.png)

### Browser Tab 4: YAML Pipeline

Navigate back to the pipeline YAML and show how the built-in `Build.BuildId` variable can be used as a task value.

```
- task: HelmDeploy@0
 displayName: 'helm package (tt-cart)'
 inputs:
 command: package
 chartPath: 'Deploy/helm/cart-api'
 arguments: '--version $(Build.BuildId)'
```

### Browser Tab 5: Azure Container Registry 

Show that a container image has been created with a version that matches the pipeline build ID.

### Terminal

Return a list of pods to get the name of the cart pod.

```
$ kubectl get pods

my-tt-cart-cart-api-77db6f9f58-wqs7p 1/1 Running 0 11h
my-tt-coupon-tt-coupons-85c96964fc-z7tc7 1/1 Running 0 15h
my-tt-image-classifier-7d6d97875f-4z66s 1/1 Running 0 15h
my-tt-login-7f88cff49-fqk95 1/1 Running 0 15h
my-tt-mobilebff-67dcb9f988-7vgc9 1/1 Running 0 15h
my-tt-popular-product-tt-popularproducts-67dfcc8b67-f7knj 1/1 Running 0 15h
my-tt-product-tt-products-d9c54d955-6fmd8 1/1 Running 0 15h
my-tt-profile-5c57bf89b4-5z79c 1/1 Running 0 15h
my-tt-stock-6b969dd459-hw559 1/1 Running 0 15h
my-tt-webbff-67849c78b7-qhvlg 1/1 Running 0 15h
web-6b56cc7d7c-w7t9x 1/1 Running 0 15h
```

Describe the cart pod to see the Docker image used to start it. Note that the image version matches the Build ID.

```
$ kubectl describe pod my-tt-cart-cart-api-77db6f9f58-wqs7p

Containers:
 cart-api:
 Container ID: docker://9438c601b838855659abef2f68ab19c281bd172525ce09aedbbcf65dc0940580
 Image: ttacr5iny4v2wygm3k.azurecr.io/cart.api:1818
```