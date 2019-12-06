# Preparing for Growth: Capacity Planning and Scaling

When your growth or the demand for your systems exceeds, or is projected to exceed, your current capacity – that’s a “good” problem to have. However, this can be just as much of a threat to your system’s reliability as any other factor.

In this session, dive into capacity planning and cost estimation basics, including the tools Azure provides to help with both. We wrap up with a discussion and demonstration of how Tailwind Traders judiciously applied Azure scaling features. Learn how to satisfy your customers and a growing demand, even when “challenged” by success.

## Demo environment deployment

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fignite-learning-paths-training-ops%2Fmaster%2Fops50%2Fdeployment%2Fazuredeploy.json" target="_blank">
 <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<br>
<br>
This deployment should take approximately 10 minutes. Note the Azure FrontDoor takes some time to become available. If you are receiving 404 errors on your Frontdoor enpoint, please wait 5-10 minutes before trying again.
<br>
<br>
It's recommended that you do this deployment at least 4 hours before your talk, so that there is time to get some traffic utilisation metrics for CosmosDB that you'll be showing in Demo 1.

## Delivery assets

The following asset can be used for delivering this talk:

- [PowerPoint deck with demo videos embedded](https://github.com/microsoft/ignite-learning-paths-training-ops/blob/master/ops50/presentations.md)

## Pre-Session Actions

Please complete the below two tasks ahead of the session. I would recommend doing these within the 24 hours before you are due to deliver the session.

### Generate Load for Azure Front Door Demo

In order to show the caching function in Azure Front Door (Demo 4). You will need to generate some traffic to your Azure Frontdoor endpoint. Here's how to do that.

**Make sure you do this within the 24 hours before your talk, but no less than 60 minutes before your talk, as you wnt to ensure the metrics have flowed through to Azure Monitor for the demonstration.**

1. Install NodeJS and NPM if you don't already have them installed. You can find the package for your machine [here](https://nodejs.org/en/download/).
2. Install the `loadtest` module by running `npm install -g loadtest` within your terminal
3. Obtain your Azure Frontdoor enpoint. You can find this in the Overview Pane of your Azure Front Door resource in the Azure Portal. (This was deployed by the ARM template above)
4. You can now run a simple loadtest to generate some traffic to our Azure Front Door
`loadtest -c 10 --rps 50 [insert-frontdoor-endpoint-here] -t 900`
5. This will run a loadtest for 15 minutes, sending 50 Requests per second with a concurrency of 10.
Feel free to adapt these figures if need be. I found that 15 minutes was long enough to be very visible on the Azure Monitor graphs.

### Clone Repo in Azure Cloud Shell

In Demo 3 where you will demonstrate scaling via queues, you will run a bash script to add messages to the queue and trigger a scaling event.

This bash script is located in this [repository](https://github.com/microsoft/ignite-learning-paths-training-ops).

1. Navigate to the Azure Portal at [https://portal.azure.com](https://portal.azure.com)
2. Open up the Azure Cloud Shell
3. Select a Bash Terminal
4. Enter the command `git clone https://github.com/microsoft/ignite-learning-paths-training-ops.git`
5. In the Cloud Shell, open file `ignite-learning-paths-training-ops/ops50/demos/scaling/params.sh`
6. Update the params.sh file to include the empty variables. All of these values can be found from the resources deployed in the ARM template above.
7. You now have the script ready in your Cloud Shell storage, for use in Demo 3.

## Demo 1 - Retrieving Capacity Metrics

### Video of how to deliver this demo

[Download mp4 version here](https://globaleventcdn.blob.core.windows.net/assets/ops/ops50/01_Capacity_Metrics.mp4)
<br>
<br>
![01_Capacity_Metrics](https://globaleventcdn.blob.core.windows.net/assets/ops/ops50/01_Capacity_Metrics.gif)

### Step by Step Instructions

In this demonstration you will demonstrate how to obtain capacity metrics from your CosmosDB Database. There is a video of this demo available [here](https://globaleventcdn.blob.core.windows.net/assets/ops/ops50/01_Capacity_Metrics.mp4)

1. Navigate to the Azure Portal at [https://portal.azure.com](https://portal.azure.com)
2. Navigate to the Azure Monitor Service by typing `Monitor` in the search bar, and selecting it.
3. Select `Metrics` on the left hand side.
4. Click `Select a resource` on the metric bar above the empty graph. This will open a blade to the right hand side.
5. In the blade, select your subscription, resource group and your Cosmos DB Account. You can type `Cosmos` in the search box to filter the resources if need be. Click Apply.
6. In the Metric drop down, select the 'Provisioned Throughput' metric. You will now see the data populated on the graph.
7. Click on the `Add Metric` button to add a new metric.
8. This time, in the Metric Drop down, select 'Total Request Units' metric.
9. On the Aggregation drop down, select 'Avg'.
10. Move the cursor over the more recent hours on the graph to show that there has been some traffic (There is a logic App in the template you deployed that sends a small ammount of dummy traffic to the Cosmos Database)
11. Explain to the audience how we have more than sufficient capacity, as we're averaging a very low RU/s average, and there is plenty (1000 RUs) pre-provisioned.
12. **Optional** - If you wish, you can also demonstrate the ammount of storage that is being used in CosmosDB by replacing the Metrics on the graph with the 'Data Usage' and the 'Available Storage' metrics.

## Demo 2 -  Cost Management

As not every presenter has insightful cost data within their subscription and the fact that for some presenters this may be sensitive information. It has been decided that this demo will be delivered by playing a video.

- The video is already embedded into the [Powerpoint Deck](https://github.com/microsoft/ignite-learning-paths-training-ops/blob/master/ops50/presentations.md)
- You can find an mp4 version of the video
  - With Audio : [here](https://globaleventcdn.blob.core.windows.net/assets/ops/ops50/02_Cost_Management.mp4)
  - Without Audio : [here](https://globaleventcdn.blob.core.windows.net/assets/ops/ops50/02_Cost_Management_noaudio.mp4)
- Here is a GIF version of the video for completion within this TTT Demo Guide.

![02_Cost_Management](https://globaleventcdn.blob.core.windows.net/assets/ops/ops50/02_Cost_Management.gif)

If you do wish to run this demo within your own account, then the items to demonstrate are:

- Azure Pricing Calculator ([aka.ms/azurecalculator](aka.ms/azurecalculator))
- Azure Cost Analysis (within the subscription pane)
  - Trend Analysis
  - How budgets are reflected
  - How you can filter on different resource groups/resources/locations by clicking on the graphs
- Budgets (within the subscription pane)
  - How to set up a monthly spend budget
  - How to have this alert to an action group if met

## Demo 3 -  Scaling with Queues

### Video of how to deliver this demo

[Download mp4 version here](https://globaleventcdn.blob.core.windows.net/assets/ops/ops50/03_Scaling.mp4)
<br>
<br>
![03_Scaling](https://globaleventcdn.blob.core.windows.net/assets/ops/ops50/03_Scaling.gif)

### Step by Step Instructions

1. Open threee tabs of the Azure Portal at [https://portal.azure.com](https://portal.azure.com)
2. In the first tab, type `Scale` in the search bar and select the 'Virtual Machine Scale Sets' service.
3. Select the scale set for this demo. You can filter on subscription/resource group to make it easier.
4. Show in the overview pane that the Scale Set is utilising three Availability Zones.
5. Click on the 'Instances' button in the left hand pane
6. Show that there is currently 2 instances in the scale set. click into each instance individually, to show they are running in different zones.
7. Click on 'Scaling' on the left hand side.
8. Explain the autoscaling rule, that we are scaling on a metric. If there are more than 10 items in the queue named `twtqueue` then we want to increase the instance count by 1.
9. In the second tab, type 'Storage' in the search bar and select the 'Storage Accounts' service.
10. Select the storage account for this demo. You can filter on subscription/resource group to make it easier.
11. Click the Queues square within the storage account overview page
12. Select the queue named `twtqueue`. Show how there are currently no messages in the queue.
13. In the third tab, open up the Azure Cloud Shell by clicking the cloud shell icon at the top of the page.
14. When the terminal has loaded type `cd ignite-learning-paths-training-ops/ops50/demos/scaling/`
15. Run the script to add messages to the queue `./add-to-queue.sh`
16. The script will show you the current instances, then after a couple of seconds, start adding messages to the queue.
17. Navigate back to tab two, and refresh the queue to show that there are now messages being added.
18. Navigate back to tab one, select instances again, and hit refresh. You should see that some new instances have been created based on our scaling rule.
    1. **Note - this may take a little longer and they won't be there first time. Fill the time by explaining more about scaling. Maybe how you could add another rule to scale down when the queue length gets smaller.**
19. Navigate back to tab three and show the script in the cloudshell completing, and finally showing the new instances in our scale set are being created.

## Demo 4 -  Going Global with Azure Front Door

In this demonstration, you will show how adding Azure Front Door, and simply configuring caching, helps your backend App Services scale globally.

**You should have ran the load test as mentioned in the Pre Session Actions for this to show any useful data**

### Video of how to deliver this demo

[Download mp4 version here](https://globaleventcdn.blob.core.windows.net/assets/ops/ops50/04_Frontdoor_Caching.mp4)
<br>
<br>
![04_Frontdoor_Caching](https://globaleventcdn.blob.core.windows.net/assets/ops/ops50/04_Frontdoor_Caching.gif)

### Step by Step Instructions

1. Navigate to the Azure Portal at [https://portal.azure.com](https://portal.azure.com).
2. Search for `Front Doors` in the Search bar and select the Front Door Service.
3. Select the front door for this demo. You can filter by Subscription / Resource Group if easier.
4. Click on 'Front Door Designer' on the left hand side.
5. Click on the Backend Pool, noting the name, and demonstrate how the Front Door is load balancing across both our Primary and Seconddary App Service Backends.
6. Click on the Routing Rule `main-rule` and explain how this means all traffic `/*` is routed towards our previously mentioned backend pool which includes both our app service instances.
7. Scroll down to show that caching is enabled. This is how simple it is to enable caching on Front Door.
8. Explain that you can choose to either cache each unique URL, or ignore the query strings.
9. Navigate to Azure Monitor by searching for `Monitor` in the search box and selecting the service.
10. Select `Metrics` from the left hand side.
11. Click `Select a resource` on the metric bar above the empty graph. This will open a blade to the right hand side.
12. In the blade, select your subscription, resource group and your front door service. You can type `Front` in the search box to filter the resources if need be. Click Apply.
13. In the drop down, select the 'Request Count' metric. You will now see the data populated on the graph.
14. Click on the `Add Metric` button to add a new metric.
15. Click on the resource to change the resource. We need to now select our Primary App Service resource in the right hand pane. Click Apply.
16. In the drop down, select the `Requests` metric.
17. Repeat steps 14 to 16 above, but this time for the Secondary App Service resource.
18. To make the graph look more compelling you may wish to reduce the time frame of the data in the top right hand side from 24 hours to something smaller such as 4 hours. This is assuming you ran your load test within the last 4 hours.
19. Move the cursor over the peak in the graph to demonstrate that the majority of traffic is being served by Azure Front Door as requests are being cached and only minimal traffic is going to the backend.
20. Finally, show that there is consistent traffic to the backend. This is all of the Azure Front Door edge nodes performing health checks on the backends.

## Teardown instructions

When done the demo environment can be deleted using the following command:

```
az group delete --name <resource group name> --yes --no-wait
```

## Resources and Continue Learning

Here is a list of related training and documentation.

[Azure Architecture Center](aka.ms/OPS50architecture)
[Architect Great Solutions on Azure - MS Learn](aka.ms/OPS50MSLearnCollection)

## Feedback loop

Do you have a comment, feedback, suggestion? Currently, the best feedback loop for content changes/suggestions/feedback is to create a new issue on this GitHub repository. To get all the details about how to create an issue please refer to the [Contributing](../../contributing.md) docs
