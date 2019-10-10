# Demo 2: Troubleshooting Guides & Status Page

| [README](/ops20/README.md) | [Slides](/ops20/slides/README.md) | [Demos](/ops20/demos/README.md) | [Deployment](/ops20/deployment/README.md) | 
|--------|-------|------------|-----------|

>**Do you need to show videos instead of doing the demo live?:** Below, you'll find "stage-ready" videos that may be used in the event this presentation should be delivered offline.

|  | Video | Description
|--------|-------|-----|
| [Part 1: Troubleshooting Guide](#part-1-azure-troubleshooting-guide) | [Link](https://coming.soon) | Describe the Troubleshooting Guide
| [Part 2: Update Status Page](#part-2-update-status-page-from-microsoft-teams) | [Link](https://coming.soon) | Demonstrate opening, updating, and closing a status announcement

---

**Question:** *What are we trying to demonstrate?*

**Answer :**
In this demonstration we want to highlight how Troubleshooting Guides can be customized in a way that they can be very useful in the early phases of response and remediation.

Additionally, we want to highlight the importance of sharing what information we have with a broader stakeholder audience. We should make clear and transparent communication of information a priority.

> **Presenter Setup Checklist:**
> 
- [ ] Troubleshooting Guide open in tab
- [ ] Status page is open in tab.
- [ ] Microsoft Teams open in browser tab (or native).
- [ ] Postman is open and ready to send the alert.

> Be sure all above are complete before beginning demo

> **NOTE:** The JSON representing the Troubleshooting Guide in this demonstration [is found here](demos/two/troubleshooting_guide_template/TroubleshootingGuideGalleryTemplate.json).

## Part 1: Azure Troubleshooting Guide

## Part 2: Update Status Page from Microsoft Teams

To set the status of our Status Page to open, run the following from the chat field in Microsoft Teams:

``` Teams
@TailwindStatus open [message]
@TailwindStatus update [message]
@TailwindStatus close [message]
@TailwindStatus help [message]
```

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/TailwindStatus.png)

>**Presenter Notes:** [More on the Microsoft Teams outgoing webhook can be found here](../../deployment/statuspage/README.md)
