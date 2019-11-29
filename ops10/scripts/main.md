# OPS 10 Main Script

## Background
This is the main script for the talk (the talk track to accompany the slides). It also contains the talk tracks and instructions for the demos (same exact text as in the demo scripts, just inserted here so you don't have flip between files).

### Pre-Requisites

There are four demos in this talk ([demo script 1](../demos/demo1.md), [demo script 2](../demos/demo2.md), [demo script 3](../demos/demo3.md) and [script 4](../demos/demo4.md)) for which you have to do some setup. including:

1. *Deploy* the Tailwind Traders application. Please see the [deployment instructions for the OPS Learning path](../../deployment/README.md) for instructions.
1. *Send specific kinds of traffic to the application* after it has been deployed. Please see the instructions for this in ([demo script 1](../demos/demo1.md).
1. *Download a specific JSON file* to your local machine (details also found in [demo script 2](../demos/demo2.md)).

The rest of this document is the full script with lines in between each slide. Enjoy!

## Script

Welcome to OPS10, the first session in the OPS learning path. I’m really delighted you could join us today. I thought we could start out with a brief introduction to the learning path and exactly what you will be able to gain from it even within the first few minutes.

We are here today to talk about this hairy beast of a subject, reliability. It doesn’t matter who you are or what you do for a living in your organization. Whether you are an operations person, someone in IT, whether you consider yourself in devops, sre, it management or perhaps a developer responsible for the creation of software. We all have a sense that the reliability of our systems, services and products are crucial to their success and to the success of our organization. 

----

As a result reliability becomes the thing that keeps people up worrying at night, keeps them from getting to sleep.

----

Ironically, it is also the thing wakes people up at night, when they get paged at 2am. When they get a call in the middle of dinner, when they spend part of their vacation on the phone to work, when the business starts to lose money instead of making money due to downtime. 

----

Besides the pages, we’ve all seen the angry red dashboards. 

----

Or worse, the angry customers on social media.

----

When reliability becomes an issue, you can lose
money
time - all of the unplanned work you have to do
reputation - customers lose patience and switch to your competitor
health - lack of uniterrupted sleep and an unpleasant job, no chance to get caught up all take a toll
hiring - we all want to recruit good talent but word gets out an no one wants to work in a constant tire fire

And worst of all, having put in countless amounts of resources into a product or service - hired the best people, added fabulous features, trained up a sales force to sell it, if it isn’t reliable, if it isn’t available when your customers try to use it, the money and the effort starts to go to waste. As Lenny Fenster, the CTO in the Microsoft Enterprise Services group says "all the bells and whistles in the world aren’t worth so much if the bells cannot be rung nor the whistles blown."

----

So the good news is, modern operations practices can help. Maybe you are here because you’ve had a problem in the past with reliability or maybe you are concerned if you don’t nail it now, it will be a problem. In either case, welcome. 

----

Welcome to Improving Your Reliability through Modern Operations Practices, the OPS Learning Path

----

In this learning path we want to specifically help you improve reliability in _your_ organization. To do that, you have to know just what things to work on and in what order.

----

In this learning path, we’re going to give you a map for exactly that. This is something you will be able to take back to your organization to offer direction when dealing with this subject.

----

The map for the LP is based on something from the site reliability engineering world called the Dickerson hierarchy of reliability. Mike Dickerson was an SRE who became the founding administrator of the United States Digital Services. He created this hierarchy while he was facing one the largest reliability crisis he had ever been asked to address. 

It is a riff on Maslow’s hierarchy of needs. Like Maslow’s hierarchy, the idea is that there are a set of levels. For us to progress up the pyramid, we need to make sure that each of the lower levels are solid first. Let’s look at the levels in this hierarchy.

----

The first level, and perhaps the most important and foundational one is monitoring. This is going to be the source of the information that will allow you to have the concrete conversations about reliability in your organization around objective data. This is how we will know what the effect of any changes we make are. In even starker terms, I would say this is how we will know whether things are getting better or not. Until we are solid on our monitoring, we can’t get the rest of the work done. But let’s assume we feel good about our monitoring in our environment, where do we go next?

----

The next level is incident response - what do we do when we do have an incident, when our systems are down or not working in a way that is impacting our customers. How effective are we at triaging the problem, getting the right resources engaged to mitigate the issue, communicating with the stakeholders about the problem, bringing things back to a better place.

----

After this, the next place we need to focus on is post-incident reviews. This is how well the organization can learn from failure, learn from incidents like these to help level up its operational practices. 

----

The next level up is a focus on our testing/release and deployment processes. You can think of this as "how well are we at creating the systems and processes to catch things before they happen, to prevent incidents from happening in the first place."

----

With the in hand, we may then begin to address the idea that success and the growth that comes with it can be as much a threat to reliability as anything else we’ve seen before if we are not prepared for it. To a customer, there’s no difference between a web site that is down because there’s a bug in the code and one that is down because too many are trying to access the site at the same time.

----

And finally, in the Dickerson hierarchy there are two other levels that we won’t be addressing in this learning path: the development process and the work that goes into making a good user experience. Other learning paths at Ignite speak to this more than we will.

So, that’s our entire hierarchy. 

----

And that hierarchy, that map I’ve given you. That’s the basis for the OPS learning path. 

----

Let’s start right in with the first level of the hierarchy. The foundation.

----

Welcome to OPS10 Building the Foundation for Modern Ops: Monitoring. My name is YOURNAMEHERE and I’m a YOURTITLE here at Microsoft.

----

For this session, there are a number of resources, all of which will be available to you after the session. I will show this slide again at the end of our time together.

----

To get started, I’d like to introduce you to the cast of characters that will appear in this session and the other sessions of the learning path.

----

First up, today we are going to meet Tailwind Traders. Tailwind Traders is a mythical hardware company you may have met if you happened to attend an Ignite event last year. They recently completed their "cloud migration" and moved their important systems to the cloud. They are a company like any other company, and like any other company they have good days and bad days, successes and failures. They have problems like everyone does, and we are hoping in this learning path that you can see a little of yourselves in their struggles so that when we show you how they have dealt with their challenges, that will resonate with you and you’ll be able take home some ideas for how to deal with your own challenges.

----

One of their challenges is they run an e-commerce website, just like I bet some of you do too. It’s kind of pretty. It looks like this. If you get bored during a break, you can actually go to tailwindtraders.com and poke around with their website. It is only a demo website so please don’t try to buy anything or enter in your real credentials. I wouldn’t want you to purchase a demo hammer or a demo screwdriver and have it works about as well as any other demo does.

----

This website is powered by a system that looks like this. I know it is a bit of a busy diagram, so let’s take a quick walk through it together. The website has a frontend, that’s what you’ll be talking to if you go to tailwindtraders.com. The frontend talks to a set of backend services. These backend services include a coupon service, a shopping cart service, and inventory service, the usual stuff. They are all running in Azure Kubernetes Service. 

----

There are other parts and technologies at play with this application. But really, all you need to focus on is the frontend and the backend services running on Kubernetes. 

----

And lest you get worried we are going to be diving into something too futuristic for your organization, you don’t even have to pay attention to the Kubernetes part for the purposes of this learning path. You can just focus on the idea that there is a frontend and a set of backend services. If you do indeed want to get into Kubernetes topics, there are other sessions here at the event which talk explicitly about it.

----

All of this stuff, you may be surprised to hear, runs in Microsoft Azure.

----

And given that, they primarily use the Azure Monitor suite of products for their monitoring. Given how important Azure Monitor is to this session, let’s dive into what it entails. I do want to say first that there is so much great stuff in Azure monitor that we could spend the entire session on just a survey of the product. But to make this session maximally useful to you, we’re going to provide some brief introductions to the breadth of the service and then immediately make sure we focus in on just what you need to use it for reliability work.

----

A look at Azure Monitor starts with the data that comes into the system. Azure Monitor takes in data from a number of different sources. It comes from your applications, just like tailwind traders application we’ve just met. It comes from the various operating systems running in Azure. All of the Azure resources subscriptions and tenants feed data in. And on top of this, if you’d like to send in monitoring-related data from your systems or applications, basically of any sort and from any source, Azure monitor can take it that custom data.

----

The data that comes in is of two types. Metrics, which are small numerical pieces of information like counters, gauges, that sort of thing, which are collected on a regular basis. The other kind of data is log data. In this session, we are going to mostly be focusing on the work you can do with logs.

----

With these two types of data, we have a whole panoply of product offerings under the Azure Monitor umbrella that allow us to understand the data that has come in, visualize, analyze, take action based on it and integrate it with other offerings. 

----

As much as it would be great to dive into all of the offerings because there is some amazing stuff here, given the length of this session we’re going to be a bit selective and focus on one or two of the offerings from each of these sections.

So let’s get into it.

----

In order for us begin to work on monitoring for reliability, there is a predecessor step we have to take. First, we need to make sure we have a reasonable level of operational awareness. The simplest way to say this is in order to work towards the reliability of systems in production, we have to have a decent understanding first of those systems and how they are functioning in production. 

----

Though it may sound peculiar, my experience talking with people in the operations world is that often the first question that needs to get answered is "What exactly is running in production?" Our production environments these days and the paths to deploying things to them are sufficiently complex that it is not uncommon to first have to do a bit of discovery first. Given a specific application, what are its component parts? what parts talk to other parts? Once we get that, we move to attempting to get a baseline around performance and "normal" behavior. 

As part of obtaining that baseline, we’ll want to perhaps dive into looking at past performance. While it is true "Past performance is no guarantee of future results" it can sometimes help us calibrate our expectations. Similarly, if we have access to information about past outages or hiccups with a service, those may give us at least some sense of potential failure modes that we’re going to need to incorporate into our thinking around reliability. 

And finally, it will be useful for us to gain some contextual knowledge around a system. Context can fall into a wide variety of buckets, much of it socio-technical. For example, and the socio- side we’ll want to gather good information about the stakeholders associated with a service or an application. You would think "oh, it’s obvious who owns or cares about a particular app/service" but in enterprise situations or other complex organizations, this can be much harder than it sounds. But the sad truth is we’re not going to be able to make much headway on the reliability of a system without that information for reasons that will become clear later when we discuss SLIs and SLOs. 

On the technical side of the context question, it will be really helpful for us to pay attention to technical questions like "just how did this application get in production?". Was it deployed by hand via an epic deployment as we’ll talk about in OPS40 or was it deployed via an automated CI/CD pipeline with a great set of unit tests, also discussed in that session? This information can have many ramifications including how easy it will be to iterate if and when we have reliability-improving updates to make. It can also be a really useful pointer to places we can make a real difference with our work.

Ok, so let’s stop talking abstractly about this idea and see a demonstration of two of the Azure features than can help improve operational awareness for you.

{demo 1}

Time for a demo. I’d like to show you two Azure offerings that can help you with this operational awareness. There are a number of components of operational awareness, but let’s focus on the deceptively simple question for the tailwind traders app: what’s actually running and how well is it doing?

For the first part of the demo, I’d like to show you one of my very favorite screens in the Azure monitor suite, the application map provided by Application Insights. If you have added the app insights hooks to your application , either by very simple stubs from the app insights SDKs (which usually just means adding a line or two of code) or the "turn on app insights" buttons within the portal, your application will start sending telemetry information to our collectors. Then magic can happen.

Tailwind traders has added these stubs in their app (by the way, did I mention their entire app is available on Github if you want to take a peek? There’s a pointer to this codebase in the resources available for this session). Let’s see just what using app insights gets us.

1. Resource Group -> tt-app-insights -> Application Map.
1. show various components of app. 
1. point out stats on components.
1. Point out stats on arrow labels.
1. Click on connector, talk about stats. 

So hopefully you can see why this Azure monitor feature excites me so much. It makes it really easy for me to understand just what components are in play, how they talk to each other, their performance, error rates, and so on. All from one screen. Just fabulous. We'll go into further detail about the application map in OPS20. I do want to give you one quick piece of advice about the Application Map before we move on to the second part of the demo: instrument your code and go look at this screen now. Get very familiar with it and all of the data it can offer you. Don’t wait until your next downtime and say "wait, what was that thing PRESENTER NAME HERE was talking about on stage back in CURRENT MONTH HERE? Where is it again in the portal?"

{demo 2}

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

{back to slides}

With the operational awareness we’ve gained through the tools we just saw, we can now confidently get into the subject you’ve all been waiting for—Monitoring for Reliability.

----

While it may be tempting to head to the portal and start clicking on things to add items to a dashboard, I’d like to take a different tack today. I’d like to start out by expanding your conception of reliability first. I have found talking to customers that they really appreciate first getting their head wrapped around what reliability can mean. It’s not uncommon for people to say "oh, I never thought of measuring that" or "hmm, we could really get a handle on this problem if we considered that aspect…". My hope is this discussion will be one of the important takeaways of this session for you.

----

So let’s talk about some of the aspects of reliability. In all of these cases we’re trying to understand and work with people’s expectations. 

----

When most people talk about reliability, they tend to start here, with availability. Is the system "up" or is it "down"? Can I reach your website, your service, use the product when I expect to? And just to be clear, even though we usually talk about this expectation of availability from the perspective of an external customer, i.e. "people couldn’t get to our website, it was down", internal customer expectations are equally important and in scope here. If you run a service that something else depends on, even something else wholly internal to your organization, availability and that "customer" is equally important. As a result, availability is a great place to start when we talk about reliability. And if spent most of your time just in this bubble, working on this aspect of reliability, that would be just fine and completely normal.

----

But coming up right after availability when we speak of reliability is latency. How much of a delay is there between a request and a response? Not sure if you’ve heard the saying "Slow is the new Down"? Especially for direct external customer interactions where, for example, someone visits your website, having that service respond as quickly as possible can be critical. There’s lots of evidence about how website slowness can drive customers to competitors, so this too becomes a reliability concern.

----

Websites aren’t the only kind of systems we run. Sometimes we run pipelines or batch processing systems. For those, we likely care about things like throughput or

----

coverage i.e. how much of the data that we had to process did we actually process.

----

One aspect of reliability that doesn’t get enough attention (in my opinion) is "correctness". Did whatever process we ran on the data yield the correct, or expected, results? If you are not now doing any sort of monitoring for correctness, can I humbly suggest you consider doing so? 

----

Fidelity in this context comes up in cases where it is possible for your service to continue to provide some sort of reduced or degraded experience when somthing goes wrong. For example, take a website where the different parts of the home page are provided by different microservices--ideally if one microservice goes down, you can still serve the home page just with that section missing or replaced with some static content. Fidelity would be the measurement of how often you showed a "degraded" experience vs. the complete page as intended with full fidelity.

----

Freshness is also a little more specialized. It might come into play with things like sports scores or election results where freshness is very much on the mind of the customer.

----

And for the final bubble of our exploration of reliability, there is durability. This becomes important in situations like storage systems where it is really crucial that a bit written to the service can be read back out again later when desired.

----

So there we have it, a whole host of things that go into the idea of something being reliable. Before we continue, there is a really, really important point that has to be made. This is so important, if you take a single thing away from this session, this could be it. 

Reliability has to measured from the customer’s perspective, not the component perspective. Let me say that again. Reliability has to measured from the customer’s perspective, not the component perspective.

----

Let’s drive this home with an example. Let's say we are in charge of running a e-commerce site that runs a web farm with 100 server instances. Something bad happens, maybe a bad OS or software update, a power fluctuation, whatever, and 14 of these 100 instances stop working. They hopefully didn’t burst into flame like this graphic suggests, but you get the idea.

Quiz time. Now remember, 14 out of the 100 instances are now totally out commission. Is the situation:
- A: no big deal? We should get to dealing with the problem at some point when we can get around it. At worst maybe we’re spending money for some broken VMs we aren’t using so we should take care of them.
- B: we should stop whatever we are doing, get to our desk, and get those 14 server instances back into service
- C: a serious emergency, perhaps an existential crisis that we should be waking up C-level executives and getting them out of bed for. We need to get all hands on deck to deal with this situation, stat!

How many people say A? B? and C? [possibly engage w/audience, curious why you say that?]

For those of you who didn’t vote A, B, and C and instead said to yourself "It depends". That’s almost the right answer to this bit of a trick question. The exact right answer is "it depends on how your customers are experiencing this outage". If you have engineered things such that no customers even noticed the backends going down, the other 86 are shouldering the load just fine, then indeed there’s no crisis here. It could be a SEV-3 or SEV-4 incident, possibly even just a support ticket. If your entire business is dead in the water and you are losing serious amounts of money for every minute you are done, yes, that’s probably a good reason to push the big red button and scramble everyone. And you can imagine that there could be a middle ground where the answer will be "B". But again, reliability has to measured from the customer’s perspective, not the component perspective. That’s why the component count of "14 machines down out of 100" is true, but not the most important piece of information from a reliability perspective in this example.

----

Let’s shift gears now from our newly expanded conception of reliability to a more practical subject. Let’s get some experience with the tool we are going to use to measure how we are doing from that reliability perspective. 

Allow me to introduce you to the tool in the Azure Monitor suite that is a favorite amongst the presenters in this learning path because of its power and how it can assist in your operational work. We are going to do a very quick, surface introduction to Azure Monitor Log Analytics, pointers to where you can find more information for a deeper dive will provided as well.

----

So let’s look at a diagram of what Log Analytics is from the Azure documentation. It is a bit detailed, so let me walk you through it. Data for log analytics comes in from a number of sources:
- windows event logs
- syslog on Linux machines
- agents running on VMs
- custom logs people choose to send in
- metrics from resources all over the platform
- and telemetry info coming in from app insights, this is another place the data we looked at before in the app insights application demo gets sent in. You might recall that in the application map we were able to drill into things like slowest operations. That’s all log analytics being shown in a different part of the UI.

----

All of this information comes in to what Azure Monitor Log Analytics calls tables, though you can think of them as separate databases if that helps. 

----

For our demos an instruction today, we are going to be pulling information from a specific table, that's the request table right here.

----

To pull information from this table, we will be writing queries. We won't go into these specific queries from the diagram, instead we will start with some other ones in a moment to bring you up to speed. 

----

How do we use this thing? Here’s what Log Analytics looks like in the portal. I’m going to zoom the page in a bit and point out the important parts of the screen.

----

On the left, we see a section of the screen that makes sure we are never totally lost when using log analytics. This part shows the tables we are potentially working with, but even better, if we were to expand a section, we’d see a listing of the fields in that table available to query. Just seeing what is available can usually be a great start to creating a query. And indeed, if you click on any of the fields, or the table name, it will get copied into the query construction area.

That’s the area at the top here. Here’s where we will specify a query and run it. We can also provide a timeframe for the data if it isn’t already specified as part of the query. We also can save queries we like or open up another tab if we want to work on several queries at a time.

And finally, on this page at the bottom is even more help. Log Analytics will show you previous queries you ran which can be really helpful if you need to return to something you’ve already specified. Let’s say you were working on a query, tried something, and had to backtrack. Also, if log analytics has a sense of the task you are attempting, perhaps via how you got to this screen, it will offer sets of recommended sample queries which also make for great starting places.

----

With all of this talk of queries, I think it is time we learn how to do basic queries. Log analytics queries are written in a language called KQL, or Kusto Query Language. Just as a little bit of trivia, even though it isn’t spelled the same way, the name Kusto, which is sort of a public code name for the system behind log analytics and data explorer, is a take on the name of the famous oceanographer Jacques Cousteau. Azure, blue, ocean, etc., etc. Just a fun fact to take back to the office tomorrow.

KQL is a query language similar in many ways to SQL, or Structured Query Language, that you may be more familiar with from the database world. If you’ve had any experience with SQL, you’ll likely be very comfortable with KQL once you understand the small syntax changes between the two. If you’ve never touched SQL before in your life, you should still be fine because it is really quick to pick up. I’m going show the very basics of KQL so you can start writing queries right away. There’s a lot of power available in KQL, so I’ll also provide a reference to the doc where you can read about more advanced uses. For example, there are ways to bring machine learning to bear in KQL, something fun to try when you get home.

----

Given that we’re going to focus on KQL queries, let’s zoom even further on to the page to the place where we type them. Almost all queries start with the table name, i.e., where are we going to query?

----

Remember when I said we were going to use the requests table? Well, that’s exactly what we are going to type first. Let me zoom in just a little bit more so everyone can see that.

----

The next part of a KQL query is to connect the table with the operation we’d like to do. For that, we use a pipe character which is, for those of you not up on the UNIX or Linux lingo, the horizontal bar on the keyboard most likely found above your slash key. So this query, sorts the table and gives us back the top 10 records found. If we wanted to just see any random 10 records instead of the top 10, for example if we want to see the table structure to make sure we are looking at the right thing, we can use the command "take 10". 

----

What if we wanted to see records that have come in within the last half an hour. We could use a query like this.

----

Like SQL, we can have multiple conditions for specifying which records we want back. They get added by using additional pipe characters and clauses. So this query finds us all of the 404 response codes (i.e. all of the page not found return codes if this was logs from a web service) in the last 30 minutes. I should point out that this query is written with a bit of efficiency in mind. By first selecting just the records from the last 30 minutes, we’ve drastically reduced the number of records the second clause has to scan through. If we wrote this in the opposite order, first it would find all of the 404’s back from the beginning of the data and then discard the vast majority to give us just the last half an hour’s worth of data. Much less efficient.

----

Another very common task you’ll find yourself doing is choosing the order of the data returned. This query sorts it by a specific field, but in descending order (i.e. most recent data first). 

----

As a final query to show you before we return to the query editor later in this session when we use the power of log analytics to help improve our reliability, here’s a query that shows how easy it is to operate on the data. This query returns a summary of the requests we received in the last half hour. So on a web service, it might tell us that there has been a GET index.html request to the URL http://tailwindtraders.com 2,875 times.

----

If you’d like to dig deeper into log analytics and KQL, and I highly recommend you do, the Azure documentation on log analytics is quite good.

----

But I bet what you really want to know is, how do I use all of this stuff to improve the reliability in my organization?

----

One very important answer to this question, perhaps the key that will unlock the whole thing for you, is the idea of creating feedback loops. The right feedback loops improve reliability in your organization. Let me repeat that…The right feedback loops improve reliability in your organization.

----

Let me do one better. Let me introduce you to a specific practice that is core to site reliability engineering which can create just the kind of feedback loop you need.

----

To understand this practice, we should put it in context. To do that, we should step back and quickly review what site reliability engineering is. But this is not a review for review’s sake, right in this the definition will be a concept that I have had many customers say have changed their whole relationship to their monitoring and its purpose.

----

Here’s my best definition of site reliability engineering. (deliberate) Site Reliability Engineering is an engineering discipline devoted to helping an organization sustainably achieve the appropriate level of reliability in their systems, services, and products. In this definition there are three specific words I want to call out, you’ll see why.

----

The first is "reliability". We’ve already talked a bunch about the importance of reliability to you and your organization, so I don’t have to belabor the point. 

----

The second, sustainably, refers to the role of people in all of this. It is crucial we create a sustainable operations practice. Reliable systems, services, products are built by people. If we don't do things to make sure that our work is sustainable—if we wake our people up at 3:00 AM every night with a page, if we don't give them time with their family, if they don't have the opportunity to spend time taking care of themselves, then there's no way they're going to be able to build reliable systems. SRE thinks it's really important that we implement an operations practice that is sustainable over time, so our people are able to bring their best to the job.

----

The final word, the one that I have observed to be a game changer for some people, is "appropriate". It's really important to talk about it because one of the things that site reliability engineering brought to the operations discussion was a notion that we should strive for an appropriate level of reliability in our systems, services, products, infrastructure, etc. Once upon a time in the operations world our goal was to make sure that everything was up 24/7. We tried to keep everything up all day long, all week long, all month long, all year long. It was never acceptable for something to go down. But it turns out, except for certain exceptions like medical devices, that thing that is maybe beating in your chest or aviation, that thing that's flying in the air, we don't really need things to be 100% reliable. And in fact 100% reliable isn't often possible. 

I'll give you one example of "not even possible". These days we are all running systems that have dependencies on other systems. Maybe you're running a piece of software that has to call out to a payment processor or has to call out to on authentication system. If the payment processor isn't a hundred percent reliable or the authentication system isn't a hundred percent reliable—and they're often not—that means it's very difficult for you to be 100% reliable in many cases. 

The other tricky thing about this is if you're shooting for 100% reliable, that means zero downtime. It also means zero chance to make changes that you think might possibly create any downtime. You don't get any head room, something you are probably going to want and need. 

So it's really useful to start to think about things from the perspective of "what’s the appropriate level of reliability?" for a particular thing that I'm trying to operate. To bring this back to the topic at hand, our monitoring will need to support this goal. 

----

In SRE, one way we do this is through a practice that involves Service Level Indicators and Service Level objectives. We’ll start with the first one, Service Level Indicators or SLIs.

----

SLIs are connected to our previous discussion about the expansive understanding of what reliability means. Remember this diagram? Well, we are going to pull it into this section too.

----

SLIs are our attempt to specify just how we are going to measure the reliability of our system. What is the service level indicator, i.e. the indicator that our service is behaving reliably, is doing what we expect? What can we measure to answer this?

----

Let’s use a few examples to see the kind of answers we are looking for. 

For example, let’s say we are working with some sort of web server. For a web server, we might be interested in the number of HTTP calls it received and the number of HTTP calls it successfully responded to. 

More precisely, we want to understand how successful it has been at being a web server by understanding the ratio of successful calls to total calls. This gives us an understanding of availability.

If we take this ratio and multiply it by 100, we get a percentage. 

If say the ratio was 0.5, we multiply that by 100, and now we come to the conclusion that our web server has been available only 50% of the time. 

----

Let’s try another one. This time let’s specify a measurement associated with the latency of the web service. We might be interested in knowing the ratio of number of operations that completed in less than 10 milliseconds against the number of total operations. If we have a ratio of 0.8, we’ve been 80% successful by this measurement.

Just to be clear this is not just a web site thing, if we had a pipeline service that processed data, we could say we need to measure coverage, i.e. how much of the data did we process. Very different system, same basic math.

----

So I have a little bad news. Even though we’ve seen a way to construct an indicator for reliability for all of these aspects of reliability, 

----

we’re still not being clear enough. We’ve left out a crucial piece of information.

----

To be clear about our reliability, we are going to have to include one more thing

----

We are going to have to say something about where we are taking this measurement. Let's go back to a couple of our previous examples and fill in the missing piece:

----

With the web service, when we measured availability, we will need to say something like # of successful calls over the number of total calls… as measured at the load balancer or as measured at the server.

----

With the latency measurement for the same service, we’ll need to say # of operations completed in less than 10ms over the # of total operations as measured at the client?

----

Why is this so crucial? If the purpose of all of this is to create a feedback loop in your organization, a feedback loop in which you are able to have conversations about reliability using objective data, it is important that the people having these conversations are using the same data. 

To use a previous example, if you are trying to determine whether a web service is meeting your expectations, and one person looks at data collected at the server itself and another looks at data collected at the load balancer in front of that web server, you may be looking at radically different sets of numbers. The information collected from the web server itself only reflects the traffic that actually reached that server. If there was an issue with the load balancer or the network itself and half the packets never even reached the web server in the first place, the two people are going to have a very different picture of the situation especially when it comes to total number of requests.

----

This might lead you to ask "Ok, so where’s the best place to measure SLIs?". The answer to that is maybe a bit unsatisfying. I would say that’s up to you, you just have to understand the tradeoffs you are making. Because there are always tradeoffs. The once piece of advice I might offer harkens back to our previous discussion on reliability: try to measure things in a place that most reflects your customer’s experience.

----

Enough talk, let’s see a demo.

{demo 3}

For this demo, tailwind traders app back into the picture. We’ll bring in all of that log analytics knowledge we now have and all of the SLI info and see how we actually measure one.

1. Resource Group -> tt-app-insights -> Logs (Analytics) (or have a tab open with query in it)

Here we are back in the query editor. Allow me to drop a pre-made query into this editor and we’ll examine it one line at a time.

{Paste in the following}

```
requests
| where timestamp > ago(5h)
| summarize succeed = count (success == true), failed = count (success == false), total = count() by bin(timestamp, 5m)
| extend SLI = succeed * 100.00 / total 
| project SLI, timestamp
| render timechart 
```

As before, we begin with the table we will be querying. Here you can see we are using our old friend, requests. The next line should also be familiar, we’re constraining the records we care about to those generated within the 5 hours. 

Next, we are going to count of the number of successful requests, the number of failed requests and total number of requests. We will keep track of this information in 5 minute units for graphing, that’s where the bin() statement comes into play. 

The next line computes the ratio of successful calls to total calls and multiples it by 100 to yield a percentage we can graph. The subsequent line tells KQL we should output this calculated SLI metric and timestamp for our graph. 

If we run this query, here’s what we get… Congratulations you’ve now seen your first SLI with Azure Monitor. Let’s take this one step further.

{back to slides}

We’ve determined how we are going to measure the reliability of something, but from an operations perspective, that only gets us half way to our goal. We can say this web server is 50% available, but is that good or bad? Or more precisely, is that the appropriate level of reliability? This is where service level objectives, or SLOs, come into play. 

----

A service level objective is just that, a statement of the objective we have from a reliability perspective. We can say, that indicator, whatever it was, 

----

we expect it to be at a certain level for a week, or for the last 30 days. 

----

Let me state this really precisely by giving you a recipe you can follow. 

To create an SLO, we’ll need three things:

first, the thing we’re going to measure. The number of HTTP requests, storage checks, operations, whatever makes sense. 

second, we’ll need the desired proportion. successful 50% of the time, can read 99.9% of the time, returned in 10 milliseconds 90% of the time. 

and finally, we’ll need some statement of time to make sure we’re all talking about the same window of data. 

So, if we put this all together, using the previous web server SLI, an example SLO might be " 90% of HTTP requests as reported by the load balancer succeeded in the last 30 day window." That's a reasonable SLO. This may seem really simple, but the good news is basic SLIs and SLOs can be this simple. If we want to make them more complex, perhaps to better model the behavior we expect out of a system there are ways to do about it but we won't talk about them here. The good news is you can and should start simple when you begin your attempts at bringing this practice into your organization.

----

Let me show you the quickest of demos for SLOs. 

{demo 4}

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

{back to slides}

The last thing I wanted to say about SLIs and SLOs before moving on is just to underline the key point of "Here it is! Here’s an operations practice you can adopt which can create a feedback loop in your organization to improve its reliability. They aren’t magic, but I’ve seen SLIs and SLOs change reliability discussions and change culture for the positive in organizations who try it. If you do try them, do let me know.

----

Ok, one last subject before we wind up this session. We’ve explored some ideas on how we can monitor and interact with the reliability of system, but we haven’t talk about an important way that reliability interacts with you. If you do decide to bring SLIs/SLOs int your organization, and set up monitoring, there’s a pitfall you can encounter I’d like to help you avoid.

----

The importance of this goes back to the part of the SRE definition we mentioned creating a sustainable operations practice that yields an appropriate level of reliability. It is important we revisit this because I want to make sure I talk about one way our monitoring can derail our efforts to put this in place. 

----

That’s alerting. 

----

More precisely, I want to make sure in your organization that you think hard about working to towards Actionable Alerting.

----

To understand this, we have to be very clear that alerts in general should be used for the situation where you need to bring a human into the process to investigate and perhaps to remediate something. If a human isn’t necessary, for example if we didn’t need to wake someone up to handle a situation that a computer could handle by scaling resources within a preset limit, then an alert is probably not necessary. A simple log line might be able to suffice in this case.

----

Because here’s the thing. Alerts are not supposed to be:
 - logs, i.e. a record of an event. 
- notifications. You probably don’t need to break into a human’s concentration on something else to announce a build has completed. 
- heartbeats. I know companies where people say "I know there’s a problem with a system if I haven’t received a page from that system in the last hour." That’s a terrible idea.
- And quite frankly, alerts are not meant to be normal. Sure, we all have them, but they are meant to be a communication that something exceptional or unexpected happen that needs someone’s attention.

----

So how do we make sure alerts are actionable and useful? Besides keeping them simple enough to understand if you are reading them at 2a afrer being woken up, there are four things every alert should contain. If you include these things to provide context to the responder, your alerts will be much more actionable.

Every alert should include:
- information about where the alert is coming from. Many companies have several monitoring systems in use at any one time and a larger number of interconnected systems. You can save someone a tremendous amount of time if you say "This alert for payroll system thx-1138 is coming from Azure monitor subscription prod."
- information about what expectation has been violated. So for example, "This server has been returning an error 30% of the time when it should have been returning errors less than 1% of the time"
- information about impact and scope, what impact does the situation you are being alerted about have (ideally stated from the customer’s point of view)
- and finally, if possible, what should the person responding do next, even if that is a pointer to a troubleshooting guide or some other documentation where they can find help for how to diagnose and remediate this problem.

If you include this sort of helpful context, I pretty much guarantee you will improve the life of anyone who receives alerts in your organization and help make your operations practices more sustainable, especially around monitoring.

----

And with that, let’s wrap up this session. To succinctly summarize what our time together has provided, I hope you now can say: {read slide}

----

So what’s up next? Well, the next level of the hierarchy on our map is:
incident response, i.e. when something does go wrong (and something will go wrong), how does your organization handle it?

----

If you’d like to learn more about some of the topics we’ve discussed today, I encourage you to check out this link to some great Microsoft Learn content.

----

Here is where you can find some of the resources we used in today’s session

----

And finally, if certification is of interest, we’re offering some free exams at this event. 

----

With that, I’d like to thank you for your time and your attention. I’ve really appreciated the opportunity to discuss this with you and I hope to talk more with you later at this event. 

(msignitethetour2019-slides-ops10)


