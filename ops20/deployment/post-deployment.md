# OPS20 Post-Deployment Steps

## Verify that the Tailwind Traders site is running

1. From the Overview blade of the Resource Group click the Container Instance named `bootstrap-container`
2. Under the Settings group in the left navigation pane, click `Containers`
3. Select the container named `Logs` by clicking it once and then select "Logs" from the list of options (Events, Properties, **Logs**, Connect)
4. Scroll to the very botoom of the log to see **Connection Information**.

You should see something like: 

```
*************** Connection Information ***************
The Tailwind Traders Website can be accessed at:
http://c6e02919d0144a45a1ed.eastus.aksapp.io

Run the following to connect to the AKS cluster:
az aks get-credentials --name tailwindtradersakswj2fmlar6aphy --resource-group ops20jahand1030a --admin
******************************************************
```

Using the URL provided, browse to the frontend of the Tailwind Traders site. 

Once you have verified the system is running, we next  need to "break" the shopping cart so that we have data to view in the demonstration.

## Break the System

Using the AKS cluster information found in the **Connection Information** at the bottom of the log, connect to the Kubernetes cluster. This will allow us to modify a configuration file to "break" the system.

1. From Cloud Shell, run the command specific to your demo environment

It should look something like: 

``` az cli
az aks get-credentials --name tailwindtradersakswj2fmlar6aphy --resource-group ops20jahand1030a --admin
```

.. where `tailwindtradersakswj2fmlar6aphy` and `ops20jahand1030a` are replaced with your own information.

Once successfully connected you should see a message like: 

```
Merged "tailwindtradersakswj2fmlar6aphy-admin" as current context in /home/jason/.kube/config
```

2. Edit the shopping cart configmap by running the following:

```
kubectl edit configmap cfg-my-tt-cart
```

This will bring up the configmap in a `vi` editor. 

3. Using your arrow keys, move the cursor down eight (8) rows to the `HOST`
4. Using the arrow keys, move the curosor over the digit (3) near the end of the URL
5. Press the `x` key to delete the digit (3)
6. Press [Esc] [colon] [w] [q] (i.e. `:wq`) to save and exit the editor
7. View the active pods by running

```
kubectl get pods

NAME                                                        READY   STATUS    RESTARTS   AGE
my-tt-cart-7cd4cbd744-dr8ng                                 1/1     Running   0          3h3m
my-tt-coupon-tt-coupons-85c96964fc-kxmfq                    1/1     Running   0          3h3m
my-tt-image-classifier-7d6d97875f-6m7v4                     1/1     Running   0          3h3m
my-tt-login-7f88cff49-8jjbz                                 1/1     Running   0          3h3m
my-tt-mobilebff-67dcb9f988-glm2p                            1/1     Running   0          3h3m
my-tt-popular-product-tt-popularproducts-6csdfdsdfgewdfdc8  1/1     Running   0          3h3m
my-tt-product-tt-products-d9c54d955-8jwdm                   1/1     Running   0          3h3m
my-tt-profile-5c57bf89b4-wxzs9                              1/1     Running   0          3h3m
my-tt-stock-6b969dd459-r2wcp                                1/1     Running   0          3h3m
my-tt-webbff-67849c78b7-bfprn                               1/1     Running   0          3h3m
web-6b56cc7d7c-sqpkm                                        1/1     Running   0          3h3m
```
Find the name of the pod associated with the shopping cart at the top of the list and copy it.

8. Run the following command to delete the pod

```
kubectl delete pod my-tt-cart-7cd4cbd744-dr8ng
```

This will remove that unique pod and provision a NEW one with the "broken" configmap.

The system is now operating in a degraded state with the `Shopping Cart` functionality "broken".

To verify this, we need to log in to the system and take a look at the shopping cart.

9. Browse to the front end site using the URL found in the *Connection Information** found above. 
10. Login using any fake credentials.
11. Click on the shopping cart and you should see errors.


Congratulations, the site is now broken and Log Analytics has begun collected data we will use in the demonstration. 

It is recommended to break the shopping cart within 24 hours of the presentation.

## Prepare for Demo 1

This demo uses Logic Apps, Azure Devops (Boards), and Microsoft Teams. Follow these steps to have everything ready for the presentation.

### Logic Apps

The Logic App should be deployed ready to go with the exception of authenticating a two of the connectors. The easiest way to do this is to authenticate the API Connections (found in the resource group).

**Authenticate Microsoft Teams and Azure Devops for use in the Logic App**
1. Browse back to the Resource Group, click on the "API Connection" named `teams`
2. Click the banner stating `This connection is not authenticated`
3. Press the "Authorize" button
4. Login with your credentials
5. Press the "Save" button
6. Repeat the same process for the "API Connection" named `visualstudioteamservices`

Now we need to grab the URL for the Logic App's endpoint so we can send and a JSON file (alert) to begin the automation.

**Find and copy the Logic App Endpoint URL**
1. Browse back to the Resource Group, click on the "Logic App" named `ops20main`
2. Click the "View in Logic Apps designer" link or the "Edit" icon near the top

**NOTE:** If you did not authenticate the API connections (step above) you will notice error indicators on several of the Logic App steps

3. Click on the first step labeled `When a HTTP request is received` to view the HTTP POST URL... and copy the address.

**Prepare Postman to send alert JSON**

1. Open Postman and create a new tab
2. Paste the URL in to the address bar
3. Change the request to `POST`
4. Click the section labeled `Body` and then `raw` (right below it)
5. Copy the JSON file found in [this repository](ops20/demos/01/alert_body.json) (right click to keep this page open)
6. Paste it in to Postman (Body-raw)
7. Click on the `Headers` section (left of Body)
8. Add `Content-Type` as the first "key"
9. Add `application/json` as the value

**NOTE:** Don't press the "Send" button just yet. We want to have Azure Boards up first.

### Azure Boards

1. Browse back to the Resource Group, click on the "Devops Project" with the name you chose during the deployment step
2. Click the blue banner that states "Click here to access your project in Azure DevOps portal -->"
3. From inside Azure Boards (in the new tab that just opened) browse to "Boards -> Boards" so that you are viewing the "Issues" Kanban board (**NOTE:** *You will need to exit out of the popup modal*)
   
Now we are ready to test our alert with Postman

4. Using Postman, "Send" the JSON data

You should see a new "Issue" display in Azure Boards and after a few additional moments, the issue will be assigned to you. Azure Boards is now ready for the demo

### Microsoft Teams

1. Open the issue that appeared in Azure Boards by clicking on the title "High Number of Failures- Severity: Critical"
2. Click the link "Communications Channel" in the `Description` field

This will launch Microsoft Teams in a new browser tab but ALSO will open the channel in your native application. Demonstrating from either will work the same.

If you see a new channel labeled Incident - 1 (random number) then everything is set for the first demonstration.

**NOTE:** The reason for the random number is so it's easier to delete the channel after the demo and reuse "Incident 1" for each new presentation.

3. Return to the Azure Boards tab
4. Select the `...` indicator in the upper right of the "Issue" and delete it so we can start fresh.
5. Leave the Azure Boards tab as it is

## Prepare for Demo 2

This demo uses Troubleshooting Guides, Microsoft Teams, and Azure Functions. Follow these steps to have everything ready for the presentation.

### Troubleshooting Guide

1. Open the troubleshooting guide JSON file found in [this repository](ops20/demos/02/TroubleshootingGuide_ARM_Template.json) (right click to keep this page open). We will copy and paste it in this demo.
2. Open a tab that is staged in Application Insights so that we can create a new Troubleshooting guide quickly.

### Azure Functions

The "Status Page" functionality of demo 2 relies on an Azure Function. We need to collect the URL of the endpoint as well as open the static HTML page in a browser tab

1. Browse back to the Resource Group, click on the "App Service" with the name containing the word `status-xxxx`. This is our Azure Function.
2. Click the `URL` link near the center of the screen to open the Status Page in a new tab. It should say "Everything is Okay" with a green background and empty history log.
3. Click the function named `teams-webhook`
4. Click the link that says `</> Get function URL`
5. Copy the URL displayed to your clipboard
6. Close the "Get function URL" modal but remain in the Functions blade
7. Right click and open a new tab using the "Resource Group" link
8. Find the Logic App named "ops20main" and open it so we are ready to begin demo 1 (the previous one)

**NOTE:** You should see that your Logic App has run once (or more). Leave this tab so we can begin the first demo here. You might want to make it your first tab.

### Microsoft Teams

To update the Status Page we are going to trigger the Azure Function using an outgoing webhook from within Microsoft Teams.

1. Find the Microsoft Teams tab (Incident-1) and click the `...` indicator just to the right of your Teams name.
2. Choose "Manage team"
3. Select the "Apps" tab
4. Click the "Create an outgoing webhook" link in the lower right of the screen
5. Provide a name, such as `StatusPage`
6. Paste the URL (in your clipboard) from the Azure Function endpoint in to the `Callback URL` field
7. Enter a description, such as "Bot to update status pages"
8. Click the "Create" button
9. Copy the security token to a scratchpad (although you'll likely not need it) and close the modal.
10. Click the `...` indicator to the right of the channel(s) you created and delete them to create a clean space for the demo.
11. Close the Microsoft Teams tab. We will open it using the link found in Azure Boards during the first demonstration.

## Prepare for Demo 3

This demo uses many different tools but there are only a few things we need to do to prepare.  Follow these steps to have everything ready for the presentation.

### KQL

While in Log Analytics, we are going to query our container logs using the following query

```KQL
ContainerLog | where LogEntry contains "cart"
```

**NOTE:** Have these instructions or the query string available in a scratchpad in order to copy/paste. Feel free to type the query as well.

### Kubernetes

While preparing demo 1, we used Kubernetes to "break" the shopping cart. We will be reversing those changes in the final demonstration. The steps are nearly identical to what you did when we started creating errors. 

1. From tab with Cloud Shell (used to break the system), run the command specific to your demo environment just to verify it is connected to the AKS cluster.

It should look something like: 

``` az cli
az aks get-credentials --name tailwindtradersakswj2fmlar6aphy --resource-group ops20jahand1030a --admin
```

2. Once connected to the Kubernetes service, leave the browser tab to be used in the final demo.

**NOTE:** It is good to `clear` the command line and place the Cloud Shell browser tab last in the row.

## Tabs To Have Open For Demo

You should have the following tabs open and ready prior to the demo

- [ ] Logic App (ops20Main) in design view
- [ ] Azure Boards in the "Issues" Kanban screen
- [ ] Azure Function for status page overview
- [ ] Troubleshooting Guide Gallery Template in GitHub 
- [ ] Log Analytics
- [ ] Application Map
- [ ] TailwindTraders Frontend in the shopping cart w/errors
- [ ] Azure Cloud shell (be prepared to log in)
  
## Also have open

- [ ] Microsoft Teams
- [ ] Postman

Once all steps are complete and the tabs and applications are ready and accessible, you are ready to begin the presentation.

Good luck!

[@jasonhand](https://twitter.com/jasonhand)