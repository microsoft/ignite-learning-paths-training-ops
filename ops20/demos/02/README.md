# Demo 2: Troubleshooting Guides & Status Page

| [README](/ops20/README.md) | [Slides](/ops20/slides/README.md) | [Demos](/ops20/demos/README.md) | [Deployment](/ops20/deployment/README.md) | 
|--------|-------|------------|-----------|

[Watch the stage ready demonstration](https://coming.soon)

**Q: What are we trying to demonstrate?**

**A: Answer**

**Summary of demo**:
Blah, blah


*This demo uses the following:*

1. Azure Troubleshooting Guide
2. Microsoft Teams
3. Azure Functions (Serverless)
4. Static HTML website

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide58.png)

> **NOTE:** The JSON representing the Troubleshooting Guide in this demonstration [is found here](demos/two/troubleshooting_guide_template/TroubleshootingGuideGalleryTemplate.json).


## Part 1: Show the Troubleshooting Guide

> **Presenter Setup Checklist:**
- [ ] Troubleshooting Guide open in tab
- [ ] Status page is open in tab.
- [ ] Microsoft Teams open in browser tab (or native).
- [ ] Postman is open and ready to send the alert.
> Be sure all above are complete before beginning demo

## Part 2: Update Status Page from Microsoft Teams

To set the status of our Status Page to open, run the following from the chat field in Microsoft Teams:

``` Teams
@TailwindStatus open [message]
@TailwindStatus update [message]
@TailwindStatus close [message]
@TailwindStatus help [message]
```

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/screenshots/TailwindStatus.png)

>**Presenter Notes:** [More on the Microsoft Teams outgoing webhook can be found here](https://github.com/anthonychu/teams-incident-status-page-bot)



## Part 3: Show Azure Function Code

Unsure if this is still in final demo.
