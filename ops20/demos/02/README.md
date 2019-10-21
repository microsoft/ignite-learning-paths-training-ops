# Demo 2: Troubleshooting Guides & Status Page

| [README](/ops20/README.md) | [Slides](/ops20/slides/README.md) | [Demos](/ops20/demos/README.md) | [Deployment](/ops20/deployment/README.md) | 
|--------|-------|------------|-----------|

>**Do you need to show videos instead of doing the demo live?:** Below, you'll find "stage-ready" videos that may be used in the event this presentation should be delivered offline.

|  | Video | Description
|--------|-------|-----|
| [Part 1: Troubleshooting Guide](#part-1-azure-troubleshooting-guide) | [Link](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_2_full.mp4) | Deploy the Troubleshooting Guide via [ARM template found here](TroubleshootingGuide_ARM_Template.json) and discuss features
| [Part 2: Update Status Page](#part-2-update-status-page-from-microsoft-teams) | [Link](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_2_full.mp4) | Demonstrate opening, updating, and closing a status announcement

---

**Question:** *What are we trying to demonstrate?*

**Answer :**
In this demonstration we want to highlight how Troubleshooting Guides can be customized in a way that they can be very useful in the early phases of response and remediation.

Additionally, we want to highlight the importance of sharing what information we have with a broader stakeholder audience. We should make clear and transparent communication of information a priority.

> **Presenter Setup Checklist:**

- [ ] [Troubleshooting Guide Gallery  template open in repo in a tab](TroubleshootingGuideGalleryTemplate.json)
- [ ] Status page is open in tab.
- [ ] Microsoft Teams open in browser tab (or native).
- [ ] Postman is open and ready to send the alert.

> Be sure all above are complete before beginning demo

> **NOTE:** The JSON representing the Troubleshooting Guide in this demonstration [is found here](demos/two/troubleshooting_guide_template/TroubleshootingGuideGalleryTemplate.json).

## Part 1: Azure Troubleshooting Guide

As of Thursday October 10th the Troubleshooting Guide has not been added to the automated deployment. So, we are going to use this as an opportunity to demonstrate how to create a new one using a template. 

There are two (2) template files in this repository.

- [ARM](demos/two/troubleshooting_guide_template/TroubleshootingARMTemplate.json)
- [Gallery](demos/two/troubleshooting_guide_template/TroubleshootingGuideGalleryTemplate.json)

We are using the gallery method as it seems to be more responsive for on-stage demos and much of the rest of the deployment is done using ARM templates.

Once the Troubleshooting Guide has been created, begin exploring it.

>**Presenter Note:** If you haven't done so already, you will want to [follow the instructions to "Break the Tailwind Traders site"](../../deployment/break_tailwindtraders/README.md). Much of the functionality of the Troubleshooting Guide requires data from our monitoring services in order to populate anything interesting to demonstrate. You will want to break the deployment as soon as possible once you have verified everything else is ready to go.


## Part 2: Update Status Page from Microsoft Teams


To set the status of our Status Page to open, run the following from the chat field in Microsoft Teams:

``` Teams
@StatusPage open [message]
@StatusPage update [message]
@StatusPage close [message]
@StatusPage help [message]
```

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/StatusPage.png)

>**Presenter Notes:** [More on the Microsoft Teams outgoing webhook can be found here](../../deployment/statuspage/README.md)
