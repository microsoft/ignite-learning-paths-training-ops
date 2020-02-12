# OPS 10 Demo 2 Script - Dashboards

## Background

* Note: This is the same script as found embedded in the [main](../scripts/main.md) file, just broken out for convenience.

## Before you Demo

1. Be sure to deploy the app and send traffic to it as per the [demo 1 script](demo1.md)
1. IMPORTANT: Download [AzureInventoryDashboard.json|(AzureInventoryDashboard.json)] to your local machine.

## Script

Ok, so let’s look at a second, slightly more traditional way people gain operational awareness. You're probably much more familiar with dashboards for answering the questions about how something is performing in production at this moment. But for this demo, I promise to show you something cool you can do with dashboards you may not have seen before.

Creating the dashboards you need are pretty simple. We can click on the pins you find on the interface, like these {click pins on graphs on Application Insights}. And then go to dashboards {navigate to dashboards} and they are added here at the bottom. There's also an edit button at the top {click edit} that gives me a tile like interface where I can drag stuff on to the dashboard I think will be useful. {drag the clock over}, and so on. Once I am done {click done}. I can then save the dashboard {click done customizing}.

If I want to share this amazing dashboard I have  made with a colleague, there are two ways I can do it. First, I can click on the Share icon, and publish it. That's not the interesting one. The interesting one has to do with these two button here: download and upload.

If I click download, the dashboard is exported as a JSON file and downloaded to my local machine. Why is this cool? Well, now I have something I can treat almost as code. I can check it into a source control system where I can version control it. If I'm handy with scripting, I can write a script to customize it, and so on. Kind of "operational awareness as code".

But I see you aren't impressed yet. Let me show you something you may not have seen before and then tie back into this idea.

One aspect of Azure you may not have encountered before is the Azure Resource Graph. The Azure Resource Graph is a data representation of all of the resources in Azure that you are using. In the past, if you wanted to get a handle on this, you would have to write a bunch of code that would query our APIs and then maybe generate some reports. With Azure Resource Graph, we can almost instantaneously query for the information we desire via the Azure Resource Graph Explorer. I find it easiest to use the top search bar to find it

{search for resource graph explorer}.

This provides a query environment which allow you to {open resource item} run queries over the dataset of the current set of resources you have in use. If you think of them as database queries where the database stores a magically updated list of all of your resources in play, you get the right idea.

So for example, if I wanted info on all of the disks I’m using on all of the compute notes I’m running, I could do something like this:

{open resources, scroll to microsoft.compute.disks, click on it to add 'where type == "microsoft.compute/disks"’}

{click run query}

Now I have a list of all of the (read the number) disks in use, {scroll window} complete with what kind they are, what region they are in, and lots of other great stuff.

I don’t want to dwell on this screen or even really explain it much because it is the same interface as the one we’ll be explore in more depth when we talk about log analytics later in the talk and I don’t want to steal its thunder. What I _do_ want to do is tie this back in to dashboards.

If we go back to dashboard, {click dashboard} and click on the Upload button we mentioned before and feed it an exported JSON dashboard file you will find in the Github repo for this session, I get the following:

{click upload, upload AzureInventoryDashboard.json}

Here’s a spiffy new dashboard that shows you a pretty dashboard of all of your resources currently in play for all of your subscriptions. {show items on dashboard}.

You can see that the tiles are Resource Graph queries (in teeny tiny type), and just to prove this, if I click on a tile {click on Sum of all Disk sizes} you can see the actual query being run. In this case, it says for all disk resources, take the diskSizeGB property, convert that to a long (signed 64-bit) number representation, then the final line sums that up). I promise we’ll come back to this very powerful query interface later. Now back to the presentation.

[Next Demo : Service Level Indicator Query using KQL in Log Analytics](demo3.md)
