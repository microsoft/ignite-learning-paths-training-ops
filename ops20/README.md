# OPS20: Responding To Incidents

![Learning Path](https://img.shields.io/badge/Learning%20Path-OPS-fe5e00?logo=microsoft)

## Session Abstract

**Your systems are down!**

*Customers are calling. Every moment counts.*

*What do you do?*

*Handling incidents well is core to meeting your reliability goals.*

*In this session, we’ll explore incident management best practices that will help you triage, remediate, and communicate as effectively as possible.*

*We’ll also explore the tools Azure provides to get you back into a working state when time is of the essence.*

---

## Table of Contents

| Resources          | Links  |
|-------------------|----------------------------------|
| PowerPoint        | - [Presentation](presentations.md)  |
| Videos            | - [Dry Run Rehearsal](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/OPS20_Final_Full.mp4) <br/>- [Microsoft Ignite Orlando Recording](https://myignite.techcommunity.microsoft.com/sessions/82997) <br/>- [Deploying the Demo Environment](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/00_Deployment.mp4) <br/>- [Post-deployment Steps](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/post_deployment.mp4) <br/>- [Director's Cut - Demo Explanations](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/TTT_DirectorsCut.mp4) <br/>- [Breaking the Shopping Cart](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/Break_TT_Cart.mp4) <br/>- [Full Presentation w/out Demo](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/01_Presentation_No_Demo.mp4) <br/>- [Presentation Section 1: Intro & Foundations of Incident Response](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/02_Presentation_Section_One.mp4) <br/>- [Demo 1: Logic Apps, Azure Boards, Microsoft Teams](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_1_full.mp4) <br/>- [Presentation Section 2: Remediation Improvements (Context & Guidance)](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/03_Presentation_Section_Two.mp4) <br/>- [Demo 2: Troubleshooting Guides & Chatops](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_2_full.mp4) <br/>- [Presentation Section 3: Tools to Reduce the Time To Recover](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/04_Presentation_Section_Three.mp4) <br/>- [Demo 3:Dashboards, Service Health, Log Analytics, KQL, Application Map](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_3_full.mp4) <br/>- [Presentation Section 4: Summary & Closing](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/05_Presentation_Section_Four.mp4) |
| Demos             | - [Demo 1 - Creating An Incident Response Plan](https://github.com/microsoft/ignite-learning-paths-training-ops/blob/master/ops20/demos/01/README.md) <br/>- [Demo 2 - Troubleshooting Guides & Status Page](demos/README.md#demo-2---plan-b-paas---webapp) <br/>- [Demo 3 - Remediation of Shopping Cart](demos/README.md#demo-3---securing-the-app-with-azure-key-vault)

---

## How To Use This Repository

Welcome, Presenter!

We're glad you are here and look forward to your delivery of this amazing content.

As an experienced presenter, we know you know **HOW** to present so this guide will focus on **WHAT** you need to present.

Among many resources, a [full run-through video of the presentation](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/OPS20_Final_Full.mp4), delivered by the original content creator is available to review and a great starting point.

Along with the video of the presentation, this document will link to all the assets you need to successfully present including PowerPoint slides and demo instructions & code.

Read this document in its entirety.
Watch the video presentation(s).

Ask questions of the Lead Presented and trained speakers (list below).

---

## Getting Started

This training repository is divided in to the following sections:

| [Slides](slides/README.md) | [Demos](/ops20/demos/README.md) | [Deployment](/ops20/deployment/README.md) |
|--------|-------|------------|
| 73 slides - 25 minutes, | 3 demos - 20 minutes, | 1 automated deployment

 [Full-length video can be viewed here](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/OPS20_Final_Full.mp4).

### **Slides**

>**What's Here?** Stage ready videos, a speaking script, numbered slide thumbnails, and the master Powerpoint slide deck.

Begin by familiarizing yourself with the presentation. Videos, speaking scripts, and the master Powerpoint slide deck can be found in the [slides](slides/README.md) section.

The Powerpoint slide deck is divided up in to four (4) sections. There are also three (3) technical demonstrations as part of the 45-minute presentation.

| Section  | Minutes | Slides | Video |
|----------|----------|-------|-----|
|[1 - Intro & Foundations of Incident Response](slides/section/01/README.md)|16 | *1 - 46* | [Link](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/02_Presentation_Section_One.mp4)
|[2 - Remediation Improvements (Context & Guidance)](slides/section/02/README.md)|6 | *48 - 57* |[Link](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/02_Presentation_Section_Two.mp4)
|[3 - Tools to Reduce the Time To Recover](slides/section/03/README.md)|1 | *59* |[Link](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/02_Presentation_Section_Three.mp4)
|[4 - Summary & Closing](slides/section/04/README.md)|2 | *66 - 73* |[Link](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/02_Presentation_Section_Four.mp4)
|Total       |25 | |[Link](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/OPS20_Final_Full.mp4)
|[Presentation thumbnails and a speaking script can be found here](slides/script/OPS20_Speaking_Script.md)|  |  |

[Take me there ...](slides/README.md)

### **Deployment**

>**What's Here?** Deploying the demo environment on Azure - including manual steps to perform after the automation is finished

[Instructions and prerequisites are outlined here](deployment/README.md).

A "Deploy to Azure" button streamlines the process, but make sure you have created an account on Azure and generated a Service Principal ID and password before you press it.

[Take me there ...](deployment/README.md)

### **Demos**

>**What's Here?** Pre-delivery preparation, stage ready videos, required files (such as JSON templates), and walk-through videos

Detailed explanations of each demonstration associated with this presentation can be found in this section. There are 3 "live from stage" technical demonstrations that utilize a number of tools both in and out of Azure. [You can get a high level overview of the tools and how we will be using them here](tools/README.md).

| Demo  | Minutes | Video |
|----------|----------|-------|
|[1 - Creating An Incident Response Plan](demos/01/README.md)| *7*   |[Link](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_1_full.mp4)
|[2 - Remediation Improvements (Context & Guidance)](demos/02/README.md)| *5* |[Link](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_2_full.mp4)
|[3 - Tools to Reduce the Time To Recover](demos/03/README.md)| *7*   |[Link](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_3_full.mp4)

[Take me there ...](demos/README.md)

---

## Assets in Train-The-Trainer kit

- Slides
  - [Master PowerPoint file (including notes for each slide)](presentations.md)
- Videos
  - [Full-length recording of presentation](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/OPS20_Final_Full.mp4)
  - ["Director's Cut" Full-length recording of presentation](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/TTT_DirectorsCut.mp4)
  - [Individual recordings of stage-ready hands-on demos (3 Demos)](demos/README.md)
  - [Individual recordings of stage-ready Powerpoint presention (4 Sections)](slides/README.md)
  - [Full-length recording of environment deployment](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/OPS20_Final_Full.mp4)
- Speaker Notes & Transcription
  - [Full speaker transcription from recording](slides/script/OPS20_Speaking_Script.md)
  
  ---

## Become a Trained Presenter

To become a **Trained Presenter**, contact scalablecontent@microsoft.com.

In your email please include:

- Complete name:
- The code of this presentation: OPS20
- Link (ex: unlisted YouTube video) to a video of you presenting (~10 minutes).
It doesn't need to be this content, the important is to show your presenter skills

## Trained Presenters

Thanks goes to these wonderful people (emoji key):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section --> <!-- prettier-ignore --> <table> <tr> <td align="center"><a href="http://cloud5mins.com/"> <img src="https://avatars0.githubusercontent.com/u/1173344?s=460&v=4" width="100px;" alt="Jason Hand"/><br /> <sub><b>Jason Hand</b></sub></a><br /> <a href="https://github.com/neilpeterson/ignite-tour-fy20/commits?author=jahand" title="talk">📢</a> <a href="https://github.com/neilpeterson/ignite-tour-fy20/commits?author=jahand" title="Documentation">📖</a> </td> <td align="center"><a href="https://blogs.technet.microsoft.com/neilp/"> <img src="https://avatars3.githubusercontent.com/u/7844635?s=460&v=4" width="100px;" alt="Neil Peterson"/><br /> <sub><b>Neil Peterson</b></sub></a><br /> <a href="https://github.com/neilpeterson/ignite-tour-fy20/commits?author=neilpeterson" title="talk">🎨</a> <a href="https://github.com/neilpeterson/ignite-tour-fy20/commits?author=neilpeterson" title="design">📖</a> </td> </tr></table> <!-- ALL-CONTRIBUTORS-LIST:END -->
