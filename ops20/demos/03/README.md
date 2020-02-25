# Demo 3: Remediation of Shopping Cart

>**Do you need to show videos instead of doing the demo live?:** Below, you'll find "stage-ready" videos that may be used in the event this presentation should be delivered offline. As of 10/18 all links below point to the full recording of demo 3. This will be broken down further soon.

|  | Video | Description
|--------|-------|-----|
| [Part 1: Azure Dashboard](#part-1-azure-dashboard) | [Link](https://https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_3_full.mp4) | Demonstrate the Azure Dashboard
| [Part 2: Azure Service Health](#part-2-azure-service-health) | [Link](https://https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_3_full.mp4) | Demonstrate Azure Service Health
| [Part 3: Log Analytics](#part-5-log-analytics) | [Link](https://https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_3_full.mp4) | Demonstrate Log Analytics
| [Part 4: KQL (Kusto Query Language)](#part-6-kql-kusto-query-language) | [Link](https://https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_3_full.mp4) | Demonstrate KQL - Kusto Query Language
| [Part 5: Application Map](#part-3-application-map) | [Link](https://https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/video/demo_3_full.mp4) | Demonstrate Application Map

**Question:** *What are we trying to demonstrate?*

**Answer:** We are demonstrating several tools within the Azure ecosystem that can help reduce the time to recover from a service disruption.

This demo touches on five (5) unique products within the Azure ecosystem we will use to "respond" & "remediate" an active "incident".

We will navigate through a number of tools beginning with the Application Dashboard. [Look here for instructions on how to create the dashboard](../../deployment/dashboard/README.md) prior to the demo.

> **Presenter Setup Checklist:**

- [ ] Azure Service Health Open in new tab (because it often takes too long to load live)

## Part 1: Azure Dashboard

The Dashboard is not created automatically during the deployment. Create the dashboard used in this demonstration, simply press the "Application Dashboard" button found in Application Insights.

From the Dashboard, we will explore the following tools:

## Part 2: Azure Service Health

Click to the tab wher Azure Service Health has already been opened prior to the presentation and explain the service. It is designed to show you problems that may be occuring in Azure that could be affecting your services. 

## Part 3: Application Map

From the Azure Application Map we should be able to see problems occuring in the connection between the front end of the system and the database.

![application map](../../media/screenshots/demo03_ApplicationMap.png)

## Part 5: Log Analytics

Demonstrate the multiple tables and features of Log Analytics such as the ability to use predefined queries, and save your own.

## Part 6: KQL (Kusto Query Language)

Demonstrate querying any part of the system by manually typing in the following query because we *"want to see all log entries that contain something about the cart"*.

``` KQL
ContainerLog | where LogEntry contains "cart"
```

End of demonstration.
