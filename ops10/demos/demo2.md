# OPS 10 Demo 2 Script - Dashboards

## Background
* Note: This is the same script as found in the [main](main.md) file, just broken out for convenience

## Before you Demo
1. Be sure to deploy the app and send traffic to it as per the [demo 1 script](demo1.md)
1. IMPORTANT: Download [AzureInventoryDashboard.json|(AzureInventoryDashboard.json)] to your local machine.

## Script

Ok, so let’s look at a second, slightly more traditional way people gain operational awareness. This tool is more closely aligned with answering the questions about how something is performing in production at this moment. But for this demo, I promise to show you an aspect of Azure you may not have seen before.

There’s been a hint of this demo on the screen prior to this. Let’s go back to the App Insights home screen again. On this screen, you can see these icons all over the place (point to pin icons). If I hover over any of them, the say things like “Pin this chart to the dashboard”. Dashboards in Azure offer the ability to collect together on one screen all of the metrics, graphs, listings, etc. that you decide are important to you for operational awareness. There are at least four ways I know of to add the information you consider important to a dashboard. The first one is through these pins. Clicking on these pins will save that item to the current dashboard, which is the last dashboard you used. 

So, if I click these two pins, <click pins>

you can see this alert at the top that I have changed my dashboard and now it has some unsaved changes. If we click on that alert, we get to the dashboard in question <click> and you can see we now have two graphs on it. We can then save that dashboard <choose save>.

The second method for creating a dashboard starts on the dashboard screen itself. If I click edit, <click edit> I get this really cool tile editor which lets me move the items on the dashboard around <move one next to the other>, add new ones by dragging them over <drag the clock over>, and so on. Once I am done <click done>. I can then save the dashboard <click save>.

Once I have a dashboard I like, I can do something which leads to a third way to get a dashboard. I can click on share, here at the top, and now I have published a dashboard that others can simply open to use. <open dashboard name, browse published dashboards>. 

And for the final way I will mention to create dashboards, I want to draw your attention to the Download and Upload buttons. If I click Download, this will export this dashboard to a file in JSON format and then download it to my local machine. Similarly, if someone sends me a dashboard JSON file, I can import it in as a new dashboard using the Upload button. I’ll demo that in a few seconds, but first let me digress to show you the feature I promised and then you will see how this all comes together.

One aspect of Azure you may not have encountered before is the Azure Resource Graph. The Azure Resource Graph is a data representation of all of the resources in Azure that you are using. In the past, if you wanted to get a handle on this, you would have to write a bunch of code that would query our APIs and then maybe generate some reports. With Azure Resource Graph, we can almost instantaneously query for the information we desire. That gets done using the Azure Resource Graph Explorer. I find it easiest to use the top search bar <search for resource  graph explorer>. This provides a query environment which allow you to <open resource item> run queries over the dataset of the current set of resources you have in use. If you think of them as database queries where the database stores a magically updated list of all of your resources, you get the right idea. 

So for example, if I wanted info on all of the disks I’m using on all of the compute notes I’m running, I could do something like this:
open resources, scroll to microsoft.compute.disks, click on it to add ‘where type == "microsoft.compute/disks”’
<click run query>
Now I have a list of all of the (read the number) disks in use, complete with what kind they are, what region they are in, and lots of other great stuff.

I don’t want to dwell on this screen or even really explain it much because it is the same interface as the one we’ll be explore in more depth when we talk about log analytics later in the talk and I don’t want to steal its thunder. What I _do_ want to do is tie this back in to dashboards.

If we go back to dashboard, <click dashboard> and click on the Upload button we mentioned before and feed it an exported JSON dashboard file you will find in the Github repo for this session, I get the following:

<click upload, upload AzureInventoryDashboard.json>

Here’s a spiffy new dashboard that shows you a pretty dashboard of all of your resources currently in play. <show items on dashboard>. You can see that the tiles are Resource Graph queries (in teeny tiny type), and just to prove this, if I click on a tile <click on Sum of all Disk sizes> you can see the actual query being run. In this case, it says for all disk resources, take the diskSizeGB property, convert that to a long (signed 64-bit) number representation, then the final line sums that up). I promise we’ll come back to this very powerful query interface later. Now back to the presentation.
