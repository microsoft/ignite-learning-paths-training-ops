# OPS 10 Demo 4 Script - SLOs in Log Analytics

## Background
* Note: This is the same script as found in the [main](main.md) file, just broken out for convenience

## Before you Demo
1. Be sure to deploy the app and send traffic to it as per the [demo 1 script](demo1.md)

## Script

1. Resource Group -> tt-app-insights -> Logs (Analytics)

Here’s a very slightly modified version of our previous query. 

Paste in:

```
requests
| where timestamp > ago(30d)
| summarize succeed = count (success == true), failed = count (success == false), total = count() by bin(timestamp, 5m)
| extend SLI = succeed * 100.00 / total 
| extend SLO = 75.0
| project SLI, timestamp, SLO 
| render timechart 
```

When I say slightly, I mean we’ve added a single line that represents our SLO. That’s this line here that says our objective is 75% availability. 

When we run this, we get a graph that looks like this. Here’s the 75% mark. A quick visual inspection can show you how well we did in relationship to this objective.