# Demo 1: Creating An Incident Response Plan

>**On Stage Demo Video:**<br/>
[Demo 1: Creating An Incident Response Plan (7:14)](https://globaleventcdn.blob.core.windows.net/assets/ops/ops10/video/Demo1-ApplicationMap.mp4)

[![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/ops20-demo1.png)](https://globaleventcdn.blob.core.windows.net/assets/ops/ops10/video/Demo1-ApplicationMap.mp4)

**Question:** *What are we trying to demonstrate?*

**Answer:**
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

We will be guiding the audience through the technical details of only one Logic App during this demonstration.

---

## Setup

Although much of the demo environment creation is automated, there are a few manual steps still left to take care of once the Tailwind Traders app is running.

### 1. Authenticate Logic App Connectors for Azure Devops and Microsoft Teams

From the resource group overview, find the API connections for Teams and Azure Devops. 

![APIAuth](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/APIconnectionauth.png)

Click in to each and authorize your own accounts and then save before exiting. Now each of these services should be connected to your own accounts. This step must be completed before running the Logic App

---

### 2. Postman

Postman is a tool (available on Windows and Mac) that allows you to send data to a URL with JSON in the body of the message. This is what is used to trigger the Logic App.

The sample [JSON is available here](https://github.com/microsoft/ignite-learning-paths-training-ops/blob/master/ops20/demos/01/alert_body.json). This is what is used in the on-stage demo when the presenter "triggers the alert". Be sure to download and familiarize yourself with Postman prior to the presentation.

---
>**Presenter Setup Checklist:**

- [ ] Logic App open in Design View.
- [ ] Azure Boards open in tab.
- [ ] Microsoft Teams open in browser tab (or native).
  
> Be sure all above are complete before beginning demo

## Part 1: Logic App

Begin the demonstration from the **Design Editor** of the Logic App.

Expand each step and explain what is happening

- HTTP Endpoint
- Create Work Item (Azure Boards)
- Create Chat Channel (Microsoft Teams)
- Update Work Item (Azure Boards)
- Post to Chat Channel (Microsoft Teams)

[Watch Demo 1: Part 1](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_1_full.mp4)

---

## Part 2: Azure Boards

Switch to the tab containing Azure Boards. You should be looking at your work items in the boards view. The query view should be empty because there are currently no items that meet the criteria.

>**Presenter Note:** After confirming there are no current work items, we send the alert using Postman.

[Watch Demo 2: Part 2](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_1_full.mp4)

---

## Part 3: Microsoft Teams

Starting in Microsoft Teams, the audience should notice a new chat channel that mathes the number of the work item from Azure Boards. It is bold because it is new to us and there is an update in there we have not viewed.

Open the new channel and point out the links that were provided.

[Watch Demo 1: Part 3](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_1_full.mp4)
