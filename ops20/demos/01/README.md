# Demo 1: Creating An Incident Response Plan

| [README](/ops20/README.md) | [Slides](/ops20/slides/README.md) | [Demos](/ops20/demos/README.md) | [Deployment](/ops20/deployment/README.md) | 
|--------|-------|------------|-----------|

>**Do you need to show videos instead of doing the demo live?:** Below, you'll find "stage-ready" videos that may be used in the event this presentation should be delivered offline.

| Part | Video | Description | 
|--------|-------|-----|-------|
| Demo 1: Part 1 | [Link](https://coming.soon) | Describe the Logic App |
| Demo 1: Part 2 | [Link](https://coming.soon) | Describe the configuration  and usage of Azure Boards |
| Demo 1: Part 3 | [Link](https://coming.soon) | Describe what's happening in Microsoft Teams

---

**Q: What are we trying to demonstrate?**

**A: Answer**
This is the first on-stage technical demonstration for **OPS20 - Responding to Incidents**. 

In this demo, we want to help the audience connect principles and practices of modern incident management (discussed in [Section 1 of the presentation](../../slides/section/01/README.md)) with concrete "hands on" examples.

We want to provide examples to demonstrate the foundations of:

- Rosters (teams)
- Roles
- Rotations

To do so, we are going to use a Logic App to trigger an automation sequence when a bit of JSON is sent to an HTTP Endpoint. 

This helps us (as the presenter) to begin this presentation "**when the alert is received**". 

The Logic App will automatically generate a work item in Azure Boards (a component of Azure Devops).

Subsequent steps of the Logic App create a new channel in Microsoft Teams, followed by posting information from the alert in to the new channel. Updates are also made to the work item to append the Microsoft Teams unique Channel ID.

There are in fact three (3) separate Logic Apps used in the demo environment. Two additional exist to fetch the details of the on-call engineer as well as a link to a troubleshooting guide.

The technical details of those Logic Apps can be found [here](https://coming.soon).

However, from stage, we'll only be showing the logic app that manages the creation of an "incident" in the form of a work item, as well as the creation and population of a new chat channel.

The supporting Logic Apps will populate the "Assigned To" field of the work item and set the "State" to **Doing**. A link to a troubleshooting guide will populate in to the new chat channel as well.

We will be guiding the audience through the technical details of only one Logic App during this demonstration.

[Watch the stage ready demonstration](https://coming.soon)

*This demo uses the following:*

1. [Logic App](../../tools/README.md)
2. [Azure Boards](../../tools/README.md)
3. [Microsoft Teams](../../tools/README.md)
4. [Postman](../../tools/README.md)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide47.png)

View the Demo here

>**NOTE:** the JSON representing this Logic App [can be found here](deployment/azuredeploy-la-main.json).

---

## Setup

>**Presenter Note:** As of October 8, the creation of Logic Apps is not 100% complete. It should be ready by 8/11/2019, at which point this first step will be removed from the setup instructions.

Although much of the demo environment creation is automated, there are a few manual steps still left to take care of once the Tailwind Traders app is running.

### 1. Authenticate Logic App Connectors for Azure Devops and Microsoft Teams

Coming soon .. 

---


### 2. Postman

Postman is a tool (available on Windows and Mac) that allows you to send data to a URL with JSON in the body of the message. This is what is used to trigger the Logic App.

The sample [JSON is available here](ops20/demos/01/alert_body.json). This is what is used in the on-stage demo when the presenter "triggers the alert". Be sure to download and familiarize yourself with Postman prior to the presentation.

---

## Part 1: Show Logic App In Detail

>**Presenter Setup Checklist:**
- [ ] Logic App open in Design View.<br />
- [ ] Azure Boards - Query for work items open in tab.
- [ ] Microsoft Teams open in browser tab (or native).
> Be sure all above are complete before beginning demo

Begin the demonstration from the **Design Editor** of the Logic App.

Expand each step and explain what is happening

- HTTP Endpoint
- Create Work Item (Azure Boards)
- Create Chat Channel (Microsoft Teams)
- Update Work Item (Azure Boards)
- Post to Chat Channel (Microsoft Teams)

[Watch Demo 1: Part 1](https://coming.soon)

---

## Part 2: Show Azure Boards Query & Reporting

Switch to the tab containing Azure Boards. You should be looking at your work items in the query view. The query view should be empty because there are currently no items that meet the criteria.

>**Presenter Note:** After confirming there are no current work items, we send the alert using Postman.

Once the alert has been sent to the Logic App endpoint, return to the query view in Azure Boards and refresh the screen.

The new Work Item will appear.

While viewing it, the details on the right will update to reflect that you (the presenter) have been assigned to the work item.

>**Presenter Note:** This requires you to update the Azure Table Storage entry so that it contains your own email address rather than the default placeholder. [Read more](https://coming.soon) about the Azure Storage portion of the demo environment.

Switch to the "Charts" view and create a new chart. (e.g. )

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/demo1_part2_00.png)

Create a new chart such as one of the above to deomonstrate the ease to quickly get a better understanding.

[Watch Demo 1: Part 2](https://coming.soon)

Now we will change to the Microsoft Teams tab (or native application).

---

## Part 3: Show Microsoft Teams

Starting in Microsoft Teams, the audience should notice a new chat channel that mathes the number of the work item from Azure Boards. It is bold because it is new to us and there is an update in there we have not viewed.

Open the new channel and point out the links that were provided.

[Watch Demo 1: Part 3](https://coming.soon)