# Logic Apps

>**Presenter Note:** As of Monday October 7th, this step has not been added to the automated deployment. Efforts are being made to include all three (3) Logic Apps, as well as the table storage in the blue **"Deploy to Azure"** button.

## Logic App One

Until then, presenters must manually deploy the logic app using the [template found here](deployment/logic_apps/azuredeploy-la-main.json).

Once the Logic App has deployed, you will need to authenticate your Microsoft accounts and modify a few fields within the Azure Devops and Microsoft Teams connections to point to your own account and instances.

### What the Logic App Does
This logic app performs the following `(5 steps)`:

Using an `(1) HTTP Endpoint` connector, as well as ones for Azure Boards and Microsoft Teams, the Logic App `(2) Creates a Work Item` (in Azure Boards), `(3) Creates a Chat Channel` (in Microsoft Teams), `(4) Updates the Work Item` (in Azure Boards), and `(5) Posts to the Chat Channel` (in Microsoft Teams).

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/logic_app_00.png)

### **(1) When a HTTP request is received**

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/logic_app_01.png)

[Use the JSON representation found here](demos/01/alert_body.json) to generate the schema.

### **(2) Create A Work Item**

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/logic_app_02.png)

Update the **Account Name** and **Project Name** fields to match your own personal credentials.

### **(3) Create A Channel**

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/logic_app_03.png)

Update the **Team** field to match your own personal credentials.

### **(4) Update a Work Item**

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/logic_app_04.png)

Update the **Account Name** field to match your own personal credentials.

### **(5) Post a message as the Flow bot to a Channel**<img src="https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/alert.gif" height="25">

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/logic_app_05.png)

Update the **Team** field to match your own personal credentials.

---


>[This video demonstrates deploying the Logic App from a template](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/06_Deploy_Logic_App_From_Template.mp4)

## Logic App Two

>**Presenter Note:** More on this coming.. (if it cannot be added to the deployment)

This logic app performs the following `(steps)`:

`(1) Lookup On-call Engineer` (in Azure Storage), `(2) Assign Engineer to the Work Item` (in Azure Boards).

## Logic App Three

This logic app performs the following `(steps)`:

`(1) Lookup Troubleshooting Guide` (in Azure Storage), `(2) Post link` (in Microsoft Teams).