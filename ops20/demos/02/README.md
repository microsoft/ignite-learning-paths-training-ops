# Demo 2: Troubleshooting Guides & Status Page

>**On Stage Demo Video:**<br/>
[Demo 2: Troubleshooting Guides & Status Page (5:36)](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_2_full.mp4)

[![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/ops20-demo2.png)](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_2_full.mp4)

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

## Part 1: Azure Troubleshooting Guide

We are going to use this as an opportunity to demonstrate how to create a new Troubleshooting guide using a template.

The troubleshooting guide web gallery template file (JSON) is found in this repository.

- [Gallery](TroubleshootingGuideGalleryTemplate.json)

We are using the gallery method as it seems to be more responsive for on-stage demos.

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
