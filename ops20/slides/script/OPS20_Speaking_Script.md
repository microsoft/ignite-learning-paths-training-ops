# OPS20 - Responding To Incidents Script

## Section 1

### Slide 1 (3 Main Takeaways)

![](../../media/slides/Slide1.png)

1. Respond with urgency, rather than react
2. Prioritize for clear communication
3. Make information & resources accessible


### Slide 2 (Title Slide)

![](../../media/slides/Slide2.png)


### Slide 3 (Resources)

![](../../media/slides/Slide3.png)

Let’s get started ..

Now is a good opportunity to take a picture of this slide..

so that you have links to all the resources I'll be sharing not only in this presentation,

but across all the talks that you're going to be participating in here at “Ignite the Tour”.

And I'll show this slide at the very end as well If you miss it.

### Slide 4 (TTR)

![](../../media/slides/Slide4.png)

How many of you are familiar with the acronym T. T. R. ?
Who can tell me what that stands for?

It’s known as the “Time To Recover” or also sometimes referred to as the “time to remediate” or “time to restore”.

In other words, the total time that it takes for us to bring services back online… with regards to the value we provide our end users and customers. What is the duration?

This is just one metric that’s often measured in order to understand how teams are performing when it comes to responding to incidents.

I think you’d all agree that complete prevention of problems isn’t very realistic. 

We must do better at knowing when something is wrong and being able to respond to it in an effective way. 
 

### Slide 5 (Elite/High Performers)

![](../../media/slides/Slide5.png)

Each year, the ”DevOps Research and Assessment” organization conducts the “State of DevOps”.

In the most recent 2019 report, they had some interesting numbers that I wanted to share with you. 

In the context of providing end user value through digital services, engineering teams that can detect, respond, and remediate disruptions in services in under an hour were classified as “Elite or High Performers”.

### Slide 6 (Medium Performers)

![](../../media/slides/Slide6.png)

Organizations categorized as “Medium Performers” are recovering from incidents in less than 24 hours …

### Slide 7 (Low Performers)

![](../../media/slides/Slide7.png)

While “Low Performers” will often take between one week to one month to recover from service disruptions.

### Slide 8 (2,604 Times Faster)

![](../../media/slides/Slide8.png)

One of the more shocking numbers from the State of DevOps Report is that those who respond and recover in less than an hour (“Elite” and “High” performers) are recovering over 2,600 times faster than their ”Low” performing peers.

Elite and High performers are also deploying to production environments over 200 times more often.

This really challenges many of our long-standing beliefs that releasing more often is just too risky.

Elite performers respond and recover faster than the rest of us, because they understand the importance of having a good foundational response plan when things inevitably go wrong.

### Slide 9 (Foundations)

![](../../media/slides/Slide9.png)

Many of the things we are going to be discussing today are foundational concepts around incident management - foundations of building reliable systems.

If you attended the OPS10 session of Ignite The Tour, you’ll recall the Dickerson Hierarchy of Reliability.

### Slide 10 (Hierarchy of Reliability)

![](../../media/slides/Slide10.png)

For those of you who aren’t familiar, let’s take a few moments and understand our objectives when it comes to building resilient and reliable systems.

*CLICK*

The principles and practices of monitoring are at the base of building reliable systems. 

Observability is provided through high confidence in our monitoring practices and tooling. 

We should be able to ask our monitoring systems anything, as well as have it alert us when something isn’t the way we want it to be. 

*CLICK*

When that alert takes place there must be some sort of response - a coordinated effort for the engineers to deal with the issue.. 

.. to understand what’s going on and do something about it.

*CLICK*

We can them learn from the incident through a Post-Incident Review exercise.

*CLICK*

It’s this “Incident Response” portion that we are going to focus on today.

### Slide 11 (Presentation Title)

![](../../media/slides/Slide11.png)

My name is Jason Hand

I’m a Senior Cloud Advocate at Microsoft

and I’m excited to be here with you talking about

“Responding To Incidents”


### Slide 12 (Incidents)

![](../../media/slides/Slide12.png)

I think we should discuss for a moment what we mean by incidents so we can come to a general understanding for today’s presentation.

I’m confident everyone would agree that an incident is a “service disruption” - something that is affecting our user's ability to use the services they have come to rely on.

*CLICK*

Incidents are commonly feared and avoided.

In some cases, we downplay the significance of an outage .. or worse .. intentionally mis-label or not report a disruption in service for fear of reprimand.

Historically, we’ve felt that incidents reflected poorly in several areas of our engineering efforts and the organization. 

It’s not been until more recently through many of the conversations around devops and site reliability engineering, that we are starting to rethink incidents and now view them as opportunities to learn and improve our systems..

*CLICK*

Incidents can also be subjective.

If you ask engineers across different organizations and industries, you’ll get many different answers about what an incident is.

Sometimes it’s only when a customer is impacted.

Others will label disruptions as incidents even if a customer never experienced a thing.

Subjectivity is an unfortunate property of incidents in a lot of cases, even when it comes to identifying severity levels.

*CLICK*

The last thing I want to point out regarding incidents, is that most of what we as engineers and technologists do is planned work.

We spend a lot of time and effort understanding the work in front of us.

We calculate story points.  We plan sprints. We mostly have a good idea on what we are supposed to be working on.

So when an incident occurs, it is disruptive. It is unplanned work.

Often, we view this as a bad thing, but if you stop and think about it, incidents are really “investments” in providing the value we are trying to deliver to end users.


### Slide 13 (Incidents are the pulse)

![](../../media/slides/Slide13.png)

I like to remind people that incidents should be viewed as the ”pulse of your systems”.

They are telling you a lot more about the system than you previously understood.

When you have a really strong foundation of monitoring (and knowing more about what’s going on in  your system),

Of course it’s going to generate more alerts and incidents and opportunities to respond.

But that doesn’t necessarily mean it’s a bad thing.

It’s telling you what’s going on.


### Slide 14 (Lifecycle)

![](../../media/slides/Slide14.png)

And all of that (in terms of monitoring) is part of the first phase of an incident – the detection phase.

You might have learned more about that in OPS10.

But what I’m here to talk about today is what happens once we receive an alert.

What is the next part that takes place?

And you can see there’s much more to an incident than just the response. 

We’ll go over remediation a little more towards the end of the presentation.

### Slide 15 (Presentation Title)

![](../../media/slides/Slide15.png)

My name is Jason Hand

I’m a Senior Cloud Advocate at Microsoft

and I’m excited to be here with you talking about

“Responding To Incidents”

### Slide 16 (Foundations: Roster, Roles, Rotations)

![](../../media/slides/Slide16.png)



### Slide 17 (Rosters)

![](../../media/slides/Slide17.png)



### Slide 18 (Roles)

![](../../media/slides/Slide18.png)



### Slide 19 (Rotations)

![](../../media/slides/Slide19.png)



### Slide 20 (Key Takeaway: Respond with urgency, rather than react)

![](../../media/slides/Slide20.png)


### Slide 21 (Incident Tracking)

![](../../media/slides/Slide21.png)



### Slide 22 (Unique Channels)

![](../../media/slides/Slide22.png)



### Slide 23 (Incident Response Improvements)

![](../../media/slides/Slide23.png)



### Slide 24 (Logic App)

![](../../media/slides/Slide24.png)



### Slide 25 (Azure Boards)

![](../../media/slides/Slide25.png)


### Slide 26 (Azure Storage)

![](../../media/slides/Slide26.png)


### Slide 27 (Microsoft Teams)

![](../../media/slides/Slide27.png)



### Slide 28 (Demo: Creating an Incident Response Plan)

![](../../media/slides/Slide28.png)



### Slide 29 (Key Takeaway)

![](../../media/slides/Slide29.png)

## Section 2

### Slide 30 (Lifecycle of an Incident)

![](../../media/slides/Slide30.png)


### Slide 31 (Remediation Improvements)

![](../../media/slides/Slide31.png)


### Slide 32 (Troubleshooting Guides)

![](../../media/slides/Slide32.png)



### Slide 33 (Update Stakeholders)

![](../../media/slides/Slide33.png)


### Slide 34 (Chatops)

![](../../media/slides/Slide34.png)


### Slide 35 (Chatops: Benefits)

![](../../media/slides/Slide35.png)



### Slide 36 (Teams: Outgoing Webhook)

![](../../media/slides/Slide36.png)


### Slide 37 (Azure Function)

![](../../media/slides/Slide37.png)

### Slide 38 (Azure Storage)

![](../../media/slides/Slide38.png)


### Slide 39 (Demo: Troubleshooting Guides & Statuspage)

![](../../media/slides/Slide39.png)


### Slide 40 (Crowd Participation)

![](../../media/slides/Slide40.png)


### Slide 41 (Demo: Remediation of Shopping Cart)

![](../../media/slides/Slide41.png)



### Slide 42 (Presenter Note)

![](../../media/slides/Slide42.png)


### Slide 43 (Presenter Note)

![](../../media/slides/Slide43.png)



### Slide 44 (Presenter Note)

![](../../media/slides/Slide44.png)


### Slide 45 (Presenter Note)

![](../../media/slides/Slide45.png)


### Slide 46 (Presenter Note)

![](../../media/slides/Slide46.png)


### Slide 47 (Key Takeaway)

![](../../media/slides/Slide47.png)

Now I’m going to show you how all of that is done using a Logic App.

### Slide 48 (Key Takeaway)

![](../../media/slides/Slide48.png)



### Slide 49 (Docs Alert)

![](../../media/slides/Slide49.png)


### Slide 50 (MS Learn Alert)

![](../../media/slides/Slide50.png)


### Slide 51 (Hidden: Certification)

![](../../media/slides/Slide51.png)


### Slide 52 (Resources)

![](../../media/slides/Slide52.png)


### Slide 53 (Upcoming sessions)

![](../../media/slides/Slide53.png)


### Slide 54 (Last slide)

![](../../media/slides/Slide54.png)

