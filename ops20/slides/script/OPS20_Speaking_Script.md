# OPS20 - Responding To Incidents Script

[/ Slides /](../../slides/README.md)
## Slide 1 (Hidden: Presenter Notes)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide1.png)

- Respond with urgency, rather than react
- Prioritize for clear communication
- Make information & resources accessible


## Slide 2 (Title Slide)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide2.png)


## Slide 3 (Resources)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide3.png)

Let’s get started ..

Now is a good opportunity to take a picture of this slide..

so that you have links to all the resources I'll be sharing not only in this presentation,

but across all the talks that you're going to be participating in here at “Ignite the Tour”.

And I'll show this slide at the very end as well If you miss it.

## Slide 4 (TTR)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide4.png)

How many of you are familiar with the acronym T. T. R. ?
Who can tell me what that stands for?

It’s known as the “Time To Recover” or also sometimes referred to as the “time to remediate” or “time to restore”.

In other words, the total time that it takes for us to bring services back online… with regards to the value we provide our end users and customers. What is the duration?

This is just one metric that’s often measured in order to understand how teams are performing when it comes to responding to incidents.

I think you’d all agree that complete prevention of problems isn’t very realistic. 

We must do better at knowing when something is wrong and being able to respond to it in an effective way. 
 

## Slide 5 (Elite/High Performers)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide5.png)

Each year, the ”DevOps Research and Assessment” organization conducts the “State of DevOps”.

In the most recent 2019 report, they had some interesting numbers that I wanted to share with you. 

In the context of providing end user value through digital services, engineering teams that can detect, respond, and remediate disruptions in services in under an hour were classified as “Elite or High Performers”.

## Slide 6 (Medium Performers)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide6.png)

Organizations categorized as “Medium Performers” are recovering from incidents in less than 24 hours …

## Slide 7 (Low Performers)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide7.png)

While “Low Performers” will often take between one week to one month to recover from service disruptions.

## Slide 8 (2,604 Times Faster)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide8.png)

One of the more shocking numbers from the State of DevOps Report is that those who respond and recover in less than an hour (“Elite” and “High” performers) are recovering over 2,600 times faster than their ”Low” performing peers.

Elite and High performers are also deploying to production environments over 200 times more often.

This really challenges many of our long-standing beliefs that releasing more often is just too risky.

Elite performers respond and recover faster than the rest of us, because they understand the importance of having a good foundational response plan when things inevitably go wrong.

## Slide 9 (Foundations)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide9.png)

Many of the things we are going to be discussing today are foundational concepts around incident management - foundations of building reliable systems.

If you attended the OPS10 session of Ignite The Tour, you’ll recall the Dickerson Hierarchy of Reliability.

## Slide 10 (Hierarchy of Reliability)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide10.png)

For those of you who aren’t familiar, let’s take a few moments and understand our objectives when it comes to building resilient and reliable systems.

## Slide 11 (Monitoring)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide11.png)

The principles and practices of monitoring are at the base of building reliable systems.

Observability is provided through high confidence in our monitoring practices and tooling.

We should be able to ask our monitoring systems anything, as well as have it alert us when something isn’t the way we want it to be.

## Slide 12 (Incident Response)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide12.png)

When that alert takes place there must be some sort of response - a coordinated effort for the engineers to deal with the issue.. 

.. to understand what’s going on and do something about it.

## Slide 13 (Post-Incident Review)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide13.png)

We can them learn from the incident through a Post-Incident Review exercise.

## Slide 14 (The Rest of the Hierachy)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide14.png)

It’s this “Incident Response” portion that we are going to focus on today.

## Slide 15 (Presentation Title)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide15.png)

My name is Jason Hand

I’m a Senior Cloud Advocate at Microsoft

and I’m excited to be here with you talking about 

“Responding To Incidents”

## Slide 16 (Incidents: Service Disruptions)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide16.png)

I think we should discuss for a moment what we mean by incidents so we can come to a general understanding for today’s presentation.

I’m confident everyone would agree that an incident is a “service disruption” - something that is affecting our user's ability to use the services they have come to rely on.

## Slide 17 (Incidents: Feared/Avoided)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide17.png)

Incidents are commonly feared and avoided. 

In some cases, we downplay the significance of an outage .. or worse .. intentionally mis-label or not report a disruption in service for fear of reprimand.

Historically, we’ve felt that incidents reflected poorly in several areas of our engineering efforts and the organization. 

It’s not been until more recently through many of the conversations around devops and site reliability engineering, that we are starting to rethink incidents and now view them as opportunities to learn and improve our systems..

## Slide 18 (Incidents: Subjective)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide18.png)

Incidents can also be subjective. 

If you ask engineers across different organizations and industries, you’ll get many different answers about what an incident is.

Sometimes it’s only when a customer is impacted.

Others will label disruptions as incidents even if a customer never experienced a thing.

Subjectivity is an unfortunate property of incidents in a lot of cases, even when it comes to identifying severity levels.

## Slide 19 (Incidents: Unplanned Work/Investments)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide19.png)

The last thing I want to point out regarding incidents, is that most of what we as engineers and technologists do is planned work. 

We spend a lot of time and effort understanding the work in front of us. 

We calculate story points.  We plan sprints. We mostly have a good idea on what we are supposed to be working on.

So when an incident occurs, it is disruptive. It is unplanned work. 

Often, we view this as a bad thing, but if you stop and think about it, incidents are really “investments” in providing the value we are trying to deliver to end users.

## Slide 20 (Incidents are the pulse of your systems)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide20.png)

I like to remind people that incidents should be viewed as the ”pulse of your systems”.

They are telling you a lot more about the system than you previously understood.

When you have a really strong foundation of monitoring (and knowing more about what’s going on in  your system),

Of course it’s going to generate more alerts and incidents and opportunities to respond.

But that doesn’t necessarily mean it’s a bad thing.

It’s telling you what’s going on.

## Slide 21 (Lifecycle of an Incident)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide21.png)

And all of that (in terms of monitoring) is part of the first phase of an incident – the detection phase.

You might have learned more about that in OPS10.

But what I’m here to talk about today is what happens once we receive an alert.

What is the next part that takes place?

And you can see there’s much more to an incident than just the response.

We’ll go over remediation a little more towards the end of the presentation.

## Slide 22 (Tailwind Traders Challenges)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide22.png)

You’ve probably heard about Tailwind Traders – our fictional online retailer.

They have a beautiful new e-commerce system built completely in the cloud.

Tailwind Trader’s is just like any company going through a digital transformation - moving parts of their business and therefore its future .. to the cloud.

There are challenges that I imagine many of you can relate to, even if you aren’t running in the cloud.

When it comes to dealing with customer impacting issues, Tailwind Traders is faced with the following challenges:

- Increased disruptions and no method to track and respond
- Everything is ad-hoc & reactionary
- Information and status is difficult to find
- Time to resolution is terrible and getting worse
- Reoccurrence of problems and mistakes

These are the challenges that Tailwind Traders (and probably many of you) are faced with when something goes wrong.

## Slide 23 (Incident Response Foundations: Rosters, Roles, Rotations)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide23.png)

If we are going to talk about the foundations of building reliable systems, including the foundations of a good incident response plan,

I think we have to start with who is responsible to respond to problems.

The best place to start, is to design what is known as a “Roster” or an on-call team. We’ll talk more about rosters in a moment.

Then we’ll talk about some of the “Roles” of the people that make up that “Roster”.

And last, we’ll talk about what a rotation is.

## Slide 24 (Rosters: Multiple members)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide24.png)

A roster, or team, is made up of multiple engineers.

## Slide 25 (Rosters: Multiple rotations)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide25.png)

Rosters can also contain multiple rotations

We’ll go over what a rotation is in a moment, but we need to build some sort of framework around who is on-call at any given point.

## Slide 26 (Roles: Primary Responder)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide26.png)

The first role we need to talk about is the “Primary Responder” – the Primary “On-call” engineer.

## Slide 27 (Roles: Secondary Responder)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide27.png)

Then we have the secondary responder – who is there as back up -

Another engineer who can step in if  the primary responder is unavailable or unreachable

## Slide 28 (Roles: Subject Matter Experts)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide28.png)

It’s very common within on-call rosters to identify subject matter experts, so that early responders know who to escalate to quickly.

These people shouldn't be on call all the time, of course, but we do want to be able to identify who is our database expert. 

Who is our front-end expert?

Who are the people that we can reach out to if our primary and secondary responders aren't able to diagnose and resolve the issue themselves.

## Slide 29 (Roles: Incident Commander)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide29.png)

Another important role to identify, in many cases, is the incident commander.

An incident commander can be very helpful when you've got a large-scale outage that effects a
lot of different components or requires coordination across many teams and different systems.

An incident commander will be that person who coordinates a lot of the conversation and the effort regarding the response and remediation activities.

An incident commander is great for making sure that engineers stay focused and they're working on their own remediation efforts.

People aren’t stepping on each other or undoing each others work. 

It's good to have a central person who can keep tabs on what's going on and who's doing what.

## Slide 30 (Roles: Scribe)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide30.png)

That takes us to our next role – the scribe

The scribe’s role is to document the conversation in as much detail as possible.

Teams commonly use phone bridges, conference calls, or video chat to get everyone together and try to understand what's
going on, which can certainly help create space for the conversation.

However, it is difficult for us to go through and understand in detail what the engineers were saying and doing unless it is transcribed.

As a result, a scribe is that person who can help us document as much as possible to review later.

What were people saying, doing, feeling, and even experiencing? 

It’s all data to be analyzed – but only if we capture it.

## Slide 31 (Roles: Communication Coordinator)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide31.png)

The last role I want to touch on is the Communication Coordinator.

The Communication Coordinator is meant to be the person working in conjunction with the incident commander to share more
information beyond those who are in the firefight actively working to recover from the incident itself.

That could be customers. It could be the sales and marketing teams. Maybe your customer support.

There are many people within an organization who need to be made aware of what’s taking place and the status around how things are progressing.

It's always good to put someone in charge of managing that communication and making sure that other stakeholders are aware of what's happening and what’s being done.

## Slide 32 (Rotations: Scheduled Shifts)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide32.png)

A rotation is a scheduled shift.

Engineers takes the “on-call” responsibility for their own specific recurring rotation.

## Slide 33 (Rotations: Types)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide33.png)

There are many different types of shifts that you can create – some more common than others.

**24 x 7** is a rotation where engineers will be “on-call” for several days in a row. However, most “Elite/High performers" would agree that rotations longer than 3 or 4 days is detrimental to the overall health of engineering staff and therefore the entire system.

**Follow the sun** shifts are nice for distributed teams. These allow for engineers to schedule their “on-call” shifts only during their normal working office hours. As they end their day and go home, engineers in a different time zone can take over.

And of course there are many ways to **customize** shifts, especially for weekends when engineers need more flexibility. Engineers should be able to easily hand off the role to someone when non-work-related conflicts arise.

## Slide 34 (Key Takeaway)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide34.png)

One of the things we really must change about how we look at incident response is that we need to respond with a sense of urgency but do so in a way that is less reactionary and more prepared and planned for.

Putting simple things in place like “on-call” roles, rosters, and rotations is a great starting point.

From there, we can respond methodically with the urgency and importance incidents deserve.

## Slide 35 (Incident Tracking: When did we know?)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide35.png)

Another thing we want to do, to address the challenges of Tailwind Traders and their incident response improvements is we want to be able to track:

**When did we know about this problem?**

Is this a new incident? If we are trying to reduce the time it takes to recover from incidents, we’ll need to start capturing when we are aware of issues.

## Slide 36 (Incident Tracking: How did we know?)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide36.png)

Not only that but we want to keep track of:

**How did we know about the problem?**

Did our monitoring systems tell us, or did a customer inform us?

If we plan to learn and improve, capturing how we knew will uncover improvement opportunities in our monitoring practices.

## Slide 37 (Incident Tracking: Who is aware of this?)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide37.png)

If I’m just finding out about a problem, am I the first to know?

**Who else is aware?**

## Slide 38 (Incident Tracking: Is anyone doing anything?)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide38.png)

And let’s say others are aware of the problem, **what (if anything) is being done?**

Is everyone assuming someone else is looking in to it?

These are difficult questions to answer if nothing is tracked.

## Slide 39 (Incident Tracking: How bad is it?)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide39.png)

And last, **How bad is it**?

We may not have any notion of severity or impact and there’s no place for us to find out how bad the problem really is, and who is affected.

These are just some of the details we want to begin tracking to improve our incident response.

## Slide 40 (Unique Channel: Conversation Bridge)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide40.png)

To address some of the challenges around how we communicate we also want to find a way to create a unique channel or space for engineers to discuss the details of the incident - a **"conversation bridge"** in our persistent group chat tool. 

Which for Tailwind Traders is Microsoft Teams.

## Slide 41 (Unique Channel: Incident Related Only)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide41.png)

We want a channel that is unique to the incident only.

We don’t want conversations about other engineering efforts.

We don’t conversations about what people are doing for lunch.

We ONLY want conversations related to the incident. Because then we can take that text (or data) and analyze later in a Post-incident review.

## Slide 42 (Logic App: Response Improvements)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide42.png)

As you can see, we have several ideas around what we need to do to improve our incident response practices. 

To summarize, the main three things we want to focus on improving are:

- Creating and tracking incident details.
- Creating space for and tracking engineering efforts related to incidents
- Maintain data for roles, rosters, rotations, and troubleshooting guides (runbooks / playbooks)

And we’ll address most of this using nothing more than a Logic App.

A Logic App is a way to schedule, automate, and stitch together data and services both internal and external to your organization.

## Slide 43 (Logic App: Connectors Used)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide43.png)

We’re going to use Azure Boards (a part of Azure Devops) to create and track our issues.

In a moment, I’ll show you how that’s done including some customization we can do to Azure Boards to track work items as incidents.

We’re also going to use Microsoft Teams in our Logic App.
That’s going to allow us to create and track our engineering efforts around specific incidents as they occur.

Last, the Logic App goes into Azure Storage to look up who is “On-call” and assign them to the incident, as well as provide a custom troubleshooting guide related to the type of problem.

## Slide 44 (Logic App : Azure Boards)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide44.png)

Before we switch to the demo and take a closer look at our Logic App, let’s examine all the functionality we are creating to address Tailwind Traders challenges.

When the Logic App starts, it’s first going to create a new “Issue” in Azure Boards.

Additional ways we’ll be using Azure Boards is to assign an engineer to the incident and set the state as “doing”.

Then depending on different triggers and steps within the Logic App, the details of the incident will be updated.

## Slide 45 (Logic App : Azure Storage)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide45.png)

Another way we are using Logic Apps here is to look up the engineer that is currently on-call..

As well as, lookup and provide helpful troubleshooting guides to the first responders.

This is done using a table within Azure Storage to maintain our “On-call” roster and rotations.

## Slide 46 (Logic App : Microsoft Teams)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide46.png)

We'll also show off Microsoft Teams and how we can create a channel – on the fly - whenever an incident is created.

It will then take the details of the incident and post them right into the new channel.

That way we have a unique channel that is reserved specifically for the incident.

## Slide 47 (Demo : Creating an incident response plan)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide47.png)

Now I’m going to show you how all of that is done using a Logic App.

## Slide 48 (Key Takeaway)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide48.png)

The key take-away I want to point out is this :

Shifting our posture from reacting – to “responding” to incidents, comes as a byproduct of prioritizing and enabling good, clear communication.

You’re making sure that you are sharing information about what is going on.

It’s in a centralized location and everyone knows how to get to it.

Prioritizing for good communication – clear communication is an essential part of building a good incident response plan.

## Slide 49 (Lifecycle of an Incident: Remediation)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide49.png)

Although thinking of incidents in terms of phases allows for us to shorten each in their own unique ways, responding to and remediating an incident often begin to blur. Especially when actions to mitigate or improve the situation, have the opposite result.

Now that we’ve covered the foundations of building a good incident response plan, let's talk about remediation efforts and what that looks like for Tailwind Traders.

## Slide 50 (Remediation Improvements)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide50.png)

When it comes to some of the improvements, we’d like to make to our remediation efforts,

### Context & Guidance Section

We would love to have better context and guidance on what engineers should be doing to restore services.

Of course, we are looking for ways to automate many of the common problems we see, but until then, we are still learning our systems and what to do in certain circumstances. 

Each engineer arrives to assist in remediation efforts with different context, mental models, expertise, and more. 
If we can find ways to provide additional context and guidance, we believe that should help us reduce our time to resolve.

### Update Stakeholders Section

We also need to find a way to prevent people from tapping us on the shoulder for updates. 

It’s important that we focus on remediation efforts, so we need to find a way to update all of the other people who really need to know (and have a right to know about) what’s going on with our system.

But we need to find a better way for us to provide updates and announcements without distracting us from resolving those issues. 

We’ll use Troubleshooting Guides, part of Application Insights to help provide additional context & guidance.

And we’ll also show you a chatops approach to updating a status page from within the incident chat channel. 

## Slide 51 (Troubleshooting Guides : Context & Guidance)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide51.png)

There are many ways to add helpful information to a troubleshooting guide:

- [Text] You can add simple text using just mark down.

- [Query] You can add queries that will retrieve and display information like you would see from within Log Analytics.

- [Metrics] You can create metrics just like you would within within different aspects of Azure Monitor.

- [Parameters] You can establish parameters to change the way queries and the metrics are displayed within the Troubleshooting guide.

- [Links] You can also put in links to anything you think might be helpful and useful to our engineers in the moment that's going to help them.

- [Images] You can also put in images if you think perhaps an architectural diagram or visual aid is going to be helpful.

## Slide 52 (Update Stakeholders)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide52.png)

It's important that internal teams are aware of what's happening when an incident occurs.

- [Internal Teams] If we don’t provide consistent updates, they’ll start coming around and asking.

They have every right to this information, but we've got to find a better way to make them aware of an issue and what is being done about it.

- [Acknowledgement] We need to find a way to be clear about our acknowledgment to our internal teams.

- [Clear] We should be clear in presenting what we know, what is being done and..

- [Expectations] What kind of expectations should they have in terms of when they're going to hear back from us?

## Slide 53 (Chatops)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide53.png)

The approach we'll use to updating stakeholders is known as chatops.

- Bringing tools into the conversation.

Chatops is nothing more than infusing a group chat tool with the conversations and actions you perform throughout your day.

## Slide 54 (Chatops: Benefits)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide54.png)

- [Collaboration] Earlier, we talked about how we need to prioritize for good, clear communication.

Working this way forces our engineers to get together in group chat and collaborate on issues as well as normal engineering efforts.

- [Sharing] It also helps us share more about what's going on in our system in terms of some of that institutional knowledge. 

Getting that information out people’s heads and into chat, so that that same information is then shared and being used by others is very important.

- [Visibility] That happens more naturally when we start moving our work in to chat.

- [Learning] is a byproduct of sharing a lot more about what's happening within engineering.

- [Empathy] When you understand more about what your peers, coworkers, and leadership are doing and thinking, including how they make their decisions, you’re able to be a lot more empathetic about what is taking place.

## Slide 55 (Chatops: Microsoft Teams)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide55.png)

Microsoft Teams is a central place where we have a lot of conversations about our engineering efforts, so we are going to start there in our ChatOps solution to providing status updates and additional context.

In the next demo we’ll use an outgoing webhook that allows us to update a status page.

## Slide 56 (Chatops: Azure Function)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide56.png)

The webhook hits an Azure Function endpoint that has some Node.js code behind it.

## Slide 57 (Chatops: Azure Storage)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide57.png)

The function then updates a static HTML page stored in Azure Blob Storage.

And you’ll see in a moment that this allows us to provide some sort of update to additional stakeholders right from within chat

Which is where we're already spending our time trying to understand what's going on.

That saves an immense amount of time updating those not involved in the response.

## Slide 58 (Demo: Troubleshooting Guides & Status Page)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide58.png)

Let's take a look at our troubleshooting guide and how to update a status page using Microsoft Teams and an Azure Function.

## Slide 59 (QR Code to see broken cart)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide59.png)

If you’d like to play along with this fictitious incident and you have your phone nearby, I encourage you to snap a picture of this QR code.

It should direct you to the Tailwind Traders application.

And you’ll probably see right away that there are a bunch of errors.

NOTE: You may have to log in with a fake account and password:  

In the time we have left for our discussion around incident response and remediation,

I thought we should show some additional things that can go a long way in reducing the time it takes to figure out what's going on and resolve the problem.

> **NOTE TO SPEAKER:** This code needs to be re-created for each new deployment.
Use https://www.qrcode-monkey.com/ to generate a new code for your presentation.

## Slide 60 (Remediation of Shopping Cart)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide60.png)

## Slide 61 (Key Takeaway)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide61.png)

The last key takeaway I’d like you to go home with is this:

When you make information, resources, and tools accessible to everyone and you provide context on how things work, engineers can respond to and remediate issues faster.

This, in-turn, reduces the time to recover from incidents and improves the reliability of your systems, services, and the value they provide.

There are many paths to both success and failure.

Information and an obstacle free path to making an impact are our best tools.

## Slide 62 (Hidden: Speaker Note)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide62.png)

## Slide 63 (Hidden: Speaker Note)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide63.png)

## Slide 64 (Hidden: Speaker Note)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide64.png)

## Slide 65 (Hidden: Speaker Note)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide65.png)

## Slide 66 (Hidden: Speaker Note)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide66.png)

## Slide 67 (3 Main Takeaways)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide67.png)

To summarize what we've talked about,

- [Respond ..] Make sure we’re responding rather than reacting. There should be a sense of urgency.

We're not looking to create tickets, that sit in some que and get passed around and escalated that had nothing to do with building the system.

We need a methodical and orchestrated response.
	
- [Prioritize] around clear communication to generate more awareness and action that will help streamline efforts and allow for historical analysis.

- [Make ..] information & resources available and accessible to a larger audience.

## Slide 68 (Docs alert)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide68.png)

## Slide 69 (MS Learn Alert)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide69.png)

## Slide 70 (Resources)

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide70.png)

## Slide 71 ()

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide71.png)

## Slide 72 ()

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide72.png)

## Slide 73 ()

![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops20/slide_thumbnails/Slide73.png)