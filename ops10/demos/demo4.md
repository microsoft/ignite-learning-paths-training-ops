# OPS 10 Demo 4 Script - SLOs in Log Analytics

>**On Stage Demo Video:**<br/>
[Demo 4: SLOs in Log Analytics (0:54)](https://globaleventcdn.blob.core.windows.net/assets/ops/ops10/video/Demo4-SLO.mp4)

[![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops10/images/demo4.png)](https://globaleventcdn.blob.core.windows.net/assets/ops/ops10/video/Demo4-SLO.mp4)

## Background

* Note: This is the same script as found embedded in the [main](../scripts/main.md) file, just broken out for convenience.

## Before you Demo

1. Be sure to deploy the app and send traffic to it as per the [demo 1 script](demo1.md)

## Script

1. Resource Group -> tt-app-insights -> Logs (Analytics) (or have a tab open with query in it)

Here’s a very slightly modified version of our previous query.

{Paste in the following}

```
requests
| where timestamp > ago(5h)
| summarize succeed = count (success == true), failed = count (success == false), total = count() by bin(timestamp, 5m)
| extend SLI = succeed * 100.00 / total
| extend SLO = 75.0
| project SLI, timestamp, SLO
| render timechart
```

When I say slightly, I mean we’ve changed two lines to add line representing our SLO. That’s this new line here that says our objective is 75% availability and the change to the line after it to include that SLO.

When we run this, we get a graph that looks like this. Here’s the 75% mark. A quick visual inspection can show you how well we did in relationship to this objective.

**End of Demos**
