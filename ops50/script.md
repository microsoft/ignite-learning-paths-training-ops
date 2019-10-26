# OPS50 - Presentation Script

🔙 [Train The Trainer Kit](README.md)

## Introduction

Hello Orlando and welcome to this session, this is the 5th session of the OPS learning path,

and in this session we're going to be talking about preparing for growth, capacity planning and scaling.

So let's have a look where we are in regard to the learning path so far. 


We've given you a map within this learning path that will not only help you know things that you can focus on to improve reliability, but also the most effective order for you to implement those steps.

The map for this Learning path is based on something from the SRE or site reliability engineering world called the Dickerson hierarchy of reliability. 

Mike Dickerson was an SRE who became the founding administrator of the United States digital services. He created this hierarchy while he was facing one of the largest reliability crises he had ever been asked to address.

It's a riff on Maslow's hierarchy of needs. Like Maslow's hierarchy the idea is that there are a set of levels. For us to progress up the pyramid we need to make sure that each of the lower levels are solid first. 

Let's look at the levels in this hierarchy. 

It consists of monitoring,

responding to incidents,

learning from,those incidents, 

creating processes that help you avoid incidents before they happen,

and finally, which is this session, dealing with growth because success can threaten reliability just as much as failures can.

Now there are two more layers that Dickerson suggests. The Development Process and the User Experience aspects, but we won't be covering them here in the ops learning path.

And as I alluded to, this is where we're going to be focusing in this particular session. We will specifically be looking at capacity and scale part of Dickerson's hierarchy of reliability.

So Tailwind Traders have a large event coming up. They're launching their latest, most innovative product yet, the electric hammer.

It's going to be a roaring success and they're expecting thousands and thousands of new users to come and hit their site. 

But as we know already, if you've attended any of the sessions in the learning path so far, there might be a couple of issues we need to address first. 

And we don't want this event to leave us a like poor bit here. Sitting around and pretending everything's fine while everything's blowing up around you. 

So we should prepare and plan for this growth, otherwise we just won't know whether our system will be okay during this increase of users and subsequently traffic.

Here's the tailwind traders architecture now. let's see where, if stuff fails we could be heading for some serious downtime.

All of these services are a single point of failure right now within the Tailwind traders architecture. 
If one of these was to get any extensive amount of load it would probably crash and there's no easy way for them to solve that at the moment, 
so one thing we'll look at in this session is how we could design these services to be both more scalable and reliable in the process.

Now let's take a look at another issue that could come and bite us. these services here all, require you to pre provision capacity i we exceed those pre provisioned limits we're going to start returning error messages to our customers and throttling their requests.

With cosmos DB for example, our noSQL datastore, we pre-provision the throughput.
 
With cognitive services, we select the tier and that tier has a maximum number of requests per second. Once we hit either of these, clients are going to get throttled.

 Will this marketing event that make us hit these limits? Right now the Tailwind traders team just don't know. 
 So that's another thing we're going to have to figure out.
 
And we even need to plan for growth where we've done stuff right. Here we're using logic apps and functions which are both examples of serverless technology. 

This means these services scale automatically and we pay per request which is brilliant. 

We are paying per use here. which is also great, that means, your bill grows just as your customer base does.

But we should at least be aware of the impact that this upcoming event may have on our costs and understand our upcoming cloud bill at the end of the month.

So another thing that we'll take a look at in this session is understanding and predicting our cloud spend.

Within the Tailwing traders engineering team, there's a number of things for us to focus on.

And hopefully these sound like challenges that you may have come across in your own day jobs as well.

## Capacity Planning 


So let's dive in and see how you can prepare for growth as well as seeing how we can make our products more scalable and reliable in the process.

Let's start by talking about scaling and when we may need to scale. 

Sometimes we can plan for scale. Maybe there's an upcoming sale event on our e-commerce website, or we've got a big product launch like Tailwind traders.

Sometimes we don't have the privilege of prior notice. Maybe a celebrity endorsed one of our products, or worse, you've been hit by a distributed denial of service attack.

Hopefully if ever these happen, you don't have to have any human intervention and the system gracefully handles the new load for you.

But we all know that this nirvana is very rarely, if not even possible for complex distributed systems that we often have today.

We're going to look at how we can plan for and scale in all three of these scenarios during this

session.

So before we dive into the meat of this session, I want to give you a quick primer.

From now on in this session I will expect some prerequisite knowledge of scaling.

If you're not familiar with these terms then this session might not be for you and you should maybe check out the awesome content in our fundamentals track.

Alternatively, there's a whole ton of great content on these topics in the Azure architecture center. Head over there if you want to find out more.

But hopefully you know the difference between scaling up and scaling out

manually scaling versus auto scaling 

and then having to scale things yourself manually, like pre provisioning request units in cosmos DB, versus services that are inherently scalable like Azure functions or Azure storage and they just scale for us.

Do hopefully I've still got you... so let's go.

I want to kick off the session by just highlighting that making our app more scalable it also makes it more reliable. 

For example, if our system auto scales, then given a component failure of a single machine, the auto scaling service will provision another to meet your minimum virtual machine count requirements.

Likewise, if you're leveraging higher level services such as Azure storage that are inherently scalable we've also built them to be reliable, so data will be replicated etc.

One good analogy is these accessibility ramps that you often see outside of buildings. They were initially designed to help those with wheelchairs, the secondary benefit of those however was that they also help parents with pushchairs too. 

This is how I like to think of scalability and reliability. If we design our systems to be scalable, the secondary benefit is that they're most likely going to be more reliable as well. 

So let's look at how we may plan for scale and growth...

The first question I often get asked is 'do I need to do capacity planning in the cloud?, it's got infinite scale hasn't it?' 

Well yes there probably is enough scale in the cloud to meet your applications demands, but we still need to understand our capacity needs for a couple of reasons. 

Firstly, we need to think about our forecasted cloud spend for our friends in finance. We'll talk more on that shortly. 

And secondly, although there's likely enough resources in the cloud, not all of the services that we consume will scale automatically, so you need to be aware that when you're going to have to scale things up, or when you're potentially going to hit service limits that are imposed by the cloud provider.

So how do we capacity planned for these kind of things in the cloud?

Let's take a look at the Tailwind traders architecture again.

The first thing we should do when looking to capacity planning in the cloud,  is to map out the current resource requirements for the larger components within our application.

We would ideally do this for everything, but we can start with the larger components.

So in this example we can maybe identify those larger components as things such as:

The azure kubernetes service cluster.
Our rewards app running in Azure app service.
Our various databases, Cosmos DB, Azure SQL and the like.

And for each of these large components we need to understand what our current resource usage is.  This will help us plan for future usage. 

Now I can't go through that for all of the components in this session but as an example, let's look at the azure cosmos DB database that we have here.

But before we dive into the demo and look at cloud capacity measures with cosmos DB,  you need to understand how we measure capacity in cosmos DB.  So I'm going to give you a whirlwind tour...

Storage is measured in gigabytes consumed and that scales automatically for us so that bits pretty simple.

Throughput however is omething that we pre provision and we use a metric called request units to measure this. 

It's a mixture of memory, CPU and IOPS to give you a single metric to plan your capacity by.

You provision request units in increments of a hundred request units per second and every database operation is measured in request units.

Reads are pretty simple. A one kilobyte read is a single request unit. Other operations are calculated on a number of factors, such as item size data consistency, query patterns etc 

When profiling your application, every response that you get from cosmos DB will contain the request charge header, telling you exactly how many request units that that request used. So if you're unsure of how much you're going to use, you can look at your queries and see exactly how many request units they consumed.

So now we understand how we measure capacity in cosmos DB let's look at how we could go and retrieve those capacity metrics.

## Demo 1 - Capacity Metrics

so now that we've got our

capacity metrics let's look at a

hypothetical example of how we might use

those metrics so this plan look at

planning for organic growth within our

environment in this example we can see

that towering traders are growing at an

average of 2,500 monthly active users

with a current user base of around


resource usage to a business metric such

as active users as this helps us plan

our capacity based on how we expect our

business to grow if we look at storage

our database is using currently about


it's growing at a rate of about 1% or 50

gigabytes per month and as I said

earlier storage Scouts automatically so

we can kind of ignore those high limits

but we will look at them later for cost

reasons our throughput is sitting at 300

our 1,000 request units and growing at

about 10 percent or 100 request units

per month understanding our systems

resource metrics means that we know when

we're likely going to have to scan our

frupa and also what our costs will be

over time throughput for example we can

predict that when it comes to May we're

going to ricky reach capacity on request

units on our database based on the

organic growth that we've been having so

there before that event we're going to

have to scow in some way one another

interest insight is that right now we

could potentially scour down our

database for a few months because we've

got plenty of room for growth and save

some costs and then just scale up a

little bit

sooner than we were currently planning

on but sometimes we really don't know

about increasing traffic or users in

these cases we need to build our system

to be as scalable as possible

automatically and to fail gracefully

when that is impossible and that's what

we're going to cover in the next part of

the session but sometimes just like our

upcoming product launch of the electric

hammer we experience in organic growth

that we can prepare for if we work

together across engineering products

marketing and finance then given our

resource usage and growth patterns that

we just obtained we can try our best to

predict the impact of these events on

our resource requirements and implement

the change accordingly getting this

right is a bit of a dark art and will

likely be specific to your organisation

and the particular event that's

happening we won't always get it right

but being as prepared as we can be will

give us a head start when we do have

these known events so let's look at an

example for towering traders and launch

of the electric hammer and how they made

plan for some in organic growth that

they're expecting so let's say for

example that the expecting event is

going to drive 5,000 more users to the

site what we know already from when we

analyzed our organic growth during the

previous graphs was that 2,500 users

equated to about 50 gigabytes of storage

and about 100 request units so we can

expect that 5,000 users would equal 100

gigabytes of storage and about 200

request units now this is approximate it

won't be exactly right but it gives us a

good starting point we can see that for

our storage capacities are more than

sufficient enough for the growth that we

expect during the event we've got plenty

of space there adding 100 gig doesn't

get us anywhere near the pesty that we

have available we can also predict that

our request units will only reach 50%

capacity following the event so we're

all good there as well sufficient

capacity we're all good in terms of

Cosmos DB exit capacity for the upcoming

product launch what about cost we're

good in terms of capacity but there will

be an impact on

mainly because our storage is being paid

for in gigabytes we can work this out

too based on the capacity dates that we

have the throughput price stays the same

as we pay for provision requests units

and we already have enough but our

storage price grows and slightly by $25

meaning that our bill for this event is

likely to increase a Cosmos DB bill by

about 25 US dollars a month so that's a

rough idea of how we could look at an

inorganic event that's coming up maybe a

marketing event or a planned event and

leverage existing resource usage

correlate that to a business metric that

we expect for the event and then plan

for an inorganic growth event capacity

planning also understands though when

we're going sub reach and hit service

limits when looking at your system in

its architecture you need to understand

the limits of the cloud services that

you're using for example by default you

can have a maximum of 200 virtual

machines per availability set this may

seem like a bunch of virtual servers if

you're just getting started out but just

be aware that when you do hit that limit

you're not going to be able to provision

anymore which could potentially result

in an outage likewise by default you can

only have 250 storage accounts per

subscription per region these are both

example of soft limits that can be

increased but some services do also have

hard limits which you can find in the

above link it's just something to be

aware of and keep an eye on and there's

a couple of ways that you can check if

you go into the azure portal you can go

into a particular subscription and then

you can select the use uses and quote

usages and quotas panel on the left you

can see exactly where we are against

current limits in the portal and you can

filter this based on service category

basis such as Network compute as well as

filter this bar region if you want to

check this programmatically each azure

service has a list usages endpoint

here's a truncated example of the list

usage endpoint for a jus virtual

networks you can see here that the

current number of V Nets being used is a

hundred and twenty four against a limit

of 1000 now remember limit increases

will require a support request so make

sure you know that ahead of

- now let's talk about cost it's easy

for me to stand here and tell you that

the scow

you just need to throw a whole ton of

resources of the problem but it's very

important to as an organization

understand the cost of your cloud

environment and adding more resources

generally equals more cost so be aware

and work with your finance team to

ensure your agreement in agreement about

current and projected cloud spend you

should forecast cost both when initially

designing and planning a project in the

cloud and also perform regular reviews

on your already running systems Asha

offers some nice hauling to help you

understand this so if we first want to

project the cost of a new project we can

open up a new tab and we can look at the

azure pricing calculator you can easily

access this at a K or MS slash measure

calculator so when you come over to the

azure pricing calculator you can start

to add the components that will make up

your architecture right in here and then

automatically you can start to see how

much they will cost you so for example

we can add one virtual machine and that

will be added down the bottom here we

can select the region that we want to

deploy it in we can set select the

operating system any kind of type of OS

we're gonna have a standard tier and

then we can choose any of the instance

types here we can select that kind of

amount of CPUs and RAM that we require

for our machine so we'll pick this one

here and we can decide to page you I

will actually preserve this for three

years and realize some savings here and

we can see that that will effectively

cost us $74 per month

we can then add our disks so we can just

go through and add all of the components

of our architecture here to give us a

projected price of what it might

actually cost us to run our services

that we're planning to deploy into a gem

now on the other hand we may have some

services that are already running in

Azure and we want to analyze those costs

so if we go over to the azure portal we

can get a list of all services here we

can search first

frictions we want to go into our

specific subscription in this case we're

going to go into my subscription here

and we getting an overview of the

details of that subscription as you can

see right off the bat there is a cost

here by resource but if we dive into

this cost analysis tab on the left here

we can really start to analyze our costs

a little bit deeper so we get some

options here we can look at our current

trend so we can click in here and see

the current Kling trend of our cloud

costs so you can see here that my actual

cost this month is 627 pounds for

October 2019

but my forecasted cost is two thousand

eight hundred and six dollars you can

see here that I've actually allocated a

budget this is a monthly spending budget

for my account so it will alert me based

when I am about to reach or once I've

reached that budget so you see here it

depicted in the red that actually I'm

projected to go over my budget this

month so I need to start analyzing some

of my resources so we can start looking

down a number of things we can see that

the majority of my resource is five

hundred and seventeen dollars worth are

running in the EE west region now if

this was an enterprise that may help you

identify which particular team may be

deploying these resources an even better

way to do so would be to look at the

resource groups you can see the high of

a resource group here called love island

which is actually sitting at

approximately a quarter of my spend just

over I've also got another one here twt

or tower win traders which is spending a

hundred and fifty six dollars so we can

click into that and then the graphs will

repopulate so we can look specifically

at that particular resource group we can

see they're actually we're spending

seventy-six dollars here on a reddish

cash out of a which is about 50% of the

spend for that resource group so do we

need to resize that is that okay is that

something that we're familiar with it

may be that that's okay because we're

aware that that's going to spend that in

which case we should probably look at

adjusting our budget

so this gives us a really kind of

snapshot view of our cloud environment

what we're currently spending a full

cast what we're most likely to spend and

also enables us to drill into particular

resources resource groups or locations

to see where our cloud spend is mostly

attributed to now those budgets I

mentioned it's super simple to add one

of those budgets we can just click on

the budgets tab on the left here we can

see that there's a monthly spend budget

here so I have this monthly spend spend

budget which is actually scoped at the

subscription level so we're looking at

the amount of spending for the

subscription we can actually set the

scope to a budget per resource group

we're currently looking at the the

entire subscription and that's a

thousand dollars and this budget resets

monthly and we're saying that once we

reach ninety percent of our budget

we're actually going to trigger an

action group and that action group here

for me is the tower wind test group

which actually sends an email to me to

let me know that I'm about to go over my

budget when I reach nine hundred dollars

within the month we can set this

percentage or whatever is more suitable

for yourselves so a really nice way for

us to look at the cost analysis of our

environment both what's currently

spending and what we're projected to

spend as well so now we spoke about

planning for growth and capacity

planning and preparing for costs all

let's talk about actually scatter

technically scaling in our architecture

and how we may go about doing that so

the first thing that I want to talk

about is the importance of performing

regular architectural views of your

systems as you learned in the previous

session if you were in it ops 40 we can

leverage practices such as

infrastructure as code to improve how we

deploy our cloud resources we update and

improve our application code regularly

which do the same with the underlying

platform resources too and performing

regular architecture review will help us

identify the areas for improvement

within our cloud resources the azure

architecture Center has a wealth of

resources to help you architect your

applications in the cloud there's a

number of scalability recommendations

there that you can find in the

application architecture guide at the

link bear so during those architectural

reviews you should find the bugs first

before scaling your resource

some examples here example if you've got

a badly designed database you may have

hot partitions and that may be why it's

not performing well you may not

necessarily have to scale it out if

you've got inefficient database queries

there's another reason why your

application may not be performing or

scaling as well as you'd like and just

improving those queries and making them

more efficient will probably help you no

end in making your application scale

better so you should go ahead and fix

these bugs before you go ahead and look

to scale your systems I think it's

important that you go ahead and look at

that first and one final thing to bear

in mind as we dive into this part of the

session as we start knowing how we can

scale applications as your you'll notice

that the some of the changes that I

speak about here often have dependencies

on other parts of the organization maybe

the developers of our applications

particularly and that's right some of

these suggestions and best practices

will require collaborations to make them

happen and although you may not be able

to implement these changes entirely by

yourself understanding the cloud system

and its capabilities in characteristics

can help you be a driver for change in

improving your system and their

scalability so let's look at how we may

make us how in Traders application a

little bit more scalable so first I want

to start with looking at what's good

about this architecture well we can see

that we've decomposed our application

into smaller micro services some of

these are seeing as containers on a

jacuz vanity service they could just as

easily be running as virtual machines or

app service environments we'll just have

a couple of those the rewards and coupon

app that's sitting in Azure app service

and we're using some inherently scalable

services such as functions and logic

apps to in the rewards application but

there are definitely some improvements

that we can make as we highlighted

earlier so how may we approach

making some of those changes I want to

focus specifically on one service the

product service

it keeps exhausting its resources and

falling over we keep getting issues with

it and also as the previous speaker

identified in the ops 30 talk on

Incident Response we saw that these

services were a single point of failure

so we can probably fix that too

now I know that in this diagram the

product service is running in kubernetes

but I don't want to assume any knowledge

of kubernetes or containers here so

we'll assume right now that this is

running on a virtual machine in Azure

the scaling concepts that I'll mention

however although it may be slightly

different implementations can be applied

to the application whether running on

servers app service or containers so

here's what the product service looks

like today it's a single VM connected to

a single Azure database so what would be

the first thing that we should do what

we really need to do is enable this

virtual machine to Scout outwards what

can help us here is we can use a

technology in Azure called virtual

machine Scout sets Scout sets let you

create a manage group of identically

load-balanced virtual machines ah yes

the load balancer now we've got more

than one VM we'll need to introduce a

load balancer so we can distribute users

traffic across both of the VMS by

leveraging VM scale sets over single

virtual machines we get a couple of

benefits firstly we can Auto scale we

can Auto scale based on host metrics in

guest metrics by application insights

monitoring or we can scale virus

schedule we can also start to leverage

availability zones these are independent

data centers within Asia region with

availability zone support it means we

can spread our VMs across multiple

availability zones which will make it

more reliable and protected from

datacenter failures when deployed across

availability zones our servers are

distributed across up to five fort

domains per datacenter new instances

will automatically be evenly distributed

within a scale set across availability

zones and adding that load balancer

becomes super simple two virtual

machines scow sets support the use of a

load balancer for basic layer 4 traffic

distribution and adder application

gateway for more advanced a layer 7

traffic distribution and SSL termination

so we can easily integrate with load

balancers when we start using scale sets

but if we do want to scale out there are

some considerations we need to think

about first we need to avoid instant

stickiness we need to make sure that no

client is being specifically stuck

specific back-end because if we scale

out or if we were worst case if we scale

in that user is no longer going to be

stuck to that Pacific back-end we also

need to remove any persistent data from

our virtual machines and offload that to

somewhere such as a redish cache or as a

storage because obviously if we're going

to scale our VMs out we can't persist

data on a single VM disk and as I

alluded to earlier it's just as

important that your application can

easily handle scaling back down as well

as scaling out and this is something

that is often overlooked so there you

have it virtual machines scale sets

enable us to scale out integrate with

low balances but make sure your

application is ready for it so we've

added some more virtual machines within

scale sets and scaling out is the

typical answer to that we need to scale

but with that we can only really scale

on a single metric and this might not be

relevant to all tasks being performed by

our product service it actually turns

out that in towering traders the product

service has a job but once a product

image is uploaded it transcode that

image and stores it in a number of

different sizes for thumbnails etc this

workload is pretty CPU intensive but the

general usage of the product service is

pretty memory intensive the encoding of

the photos of the transcribing of the

photos is an asynchronous task that can

be broken in to a background job so we

can actually decoupling service via

queue this means that we can then Scout

both of our services more independently

one on memory the product service and

the other our image processing service

based on CPU or either the length of the

queue with the items that is processing

we can have another Scout set be the

workers for that queue and consume those

messages and process the images there

are two ways to do queues in Azure

firstly you've got aja storage cubes

this is a pretty basic cube for just

storing tons of plain simple information

and have some a worker request items

from the queue there's also service bus

queues and this offers some more

advanced functionality and is part of

the wider Asha integration services that

we have available

because our use case is pretty simple

here we're going to be using Azure

storage queues for storing simple

messages in a queue for our workers to

consume so let's go and look at how we

can scale with queues so if we go over

to the azure portal here and we look at

house we search for scow sets we'll be

able to see that what we have is a tower

in traders scale set this is the scow

set that is our image processing service

we can see how many instances there are

we've currently got two instances

running in that scow set if we go into

these specific instances we can see that

this instance is running in zone 3 and

this one is running in zone 1 so we're

deployed across two different

availability zones we can also go ahead

and look at the queue that is consuming

these so if we go to either storage

you can see that we also have a towel in

traders queue this is the queue which

the image processing requests are being

added to if we look at the particular

queue within this storage account called

twt you can see there's actually no

messages in the queue so what we're

going to do we're going to come over

here we're going to run a quick script

which is going to add a bunch of

messages about 50 messages into the

queue so we can see here there's two

current instances in the scale set we're

going to wait a few seconds and then

we're gonna start sending messages to

the queue so you can see that we're

adding messages right now into that

queue if we go back over to our queue

here we can refresh that and we can

start seeing that the items are now

being added into our queue each of the

unique ID and all with the same

messaging hello ignite the talk now if

we go back to our Scouter we should see

shortly that we see some new instances

start running in here based on our

scaling trigger being hit what we don't

have in here but we could do is we could

add another scalp condition actually

Scout this back down when our message

count really dropped below another

number so we could say when the message

count was below 5 we can decrease the

count of instances by one and that would

mean that we were able to then scale

down the way we have this configured at

the moment is that actually we're just

going to continually scale up whenever

the queue gets bigger it's best practice

to actually add a scale down rule as

well so we can see now there's a bunch

of messages in the queue and hopefully

the instances in our scowl set will be

able to see shortly here we go a couple

of instances that are now being created

and based on the length of that queue

now our metric was more than 20 we've

obviously put over 40 messages in the

queue so it's added an extra two virtual

machines to our scow set to deal with

that increased load so if we come back

to our script here we'll see that that's

completed running and we can see at the

end there are the those four instances

in our bridge in our scale sets at the

end so a really simple example of how we

can decouple our systems and scowl and

in this case our image processing

service independently by the

decoupling by accuse another way that we

can improve the the performance of

application is to implement some kind of

in-memory cache now we know that

performance does not equal scalability

exactly but by improving the performance

application we can reduce the load on

other resources meaning we hopefully

don't have to scale as soon as your cash

for registred s is a managed Redis

offering and British can be used for a

number of patterns or use cases for a

product service we would likely

implement the cache acai pattern which

means that we would load items in the

database into the cache as needed making

an application more performant and

reducing the load on our back-end

database Redis can also be used as a

messaging queue for caching web content

or for user session caching these may be

more suitable to other parts of the

tower wind traders application such as a

shopping cart service where we may

leverage a Redis cache as a session

store for users shopping cart data so

now that we've made our compute more

scalable we've got a redis cache with

got out with decoupled using queues and

let's take a look at our database we're

using Azure sequel database here which

means it's a managed sequel server

offering from Asia as a relational

database are much harder to scale out

the non traditional databases

non-relational databases the first thing

we may do in order to scale is to scale

up the size of the database this can be

done very simply with the adage a sequel

for a simple API call or even a slider

in the portal and you have an average

downtime of under 4 seconds for scaling

up sequel server instance with integer

sequel if this doesn't mean our meet our

requirements depending on our traffic

characteristics it may be suitable to

scale out the reads of the database

using read replicas with Azure sequel if

you're using the premium or

business-critical tiers read scale out

is enabled by default he actually can't

be enabled in basic and standard tiers

so you will need to upgrade but this

enables to route particular traffic to

our read replicas this will have to be

implemented in code dope

hence why it matters what your traffic

characteristics are lying

what you can simply do is update the

application intense attribute in your

database connection string within your

application to reflect which server you

need to connect to now as it needs to be

up in our code it might not be suitable

what if every single product service

needs the ability to read and write in

that case we need to look at scaling out

sequel database by a shunting called

sharding so we've scaled up with added

Reed replicants our database resources

still don't meet the needs our system

annex option here is what we just

discussed is sharding sharding is a

technique to distribute large amounts of

identically structured data across a

number of independent databases it may

be required for a number of reasons it

could be that the total amount of data

is too large to fit within the

constraints of an individual database

the transaction throughput of the

overall workload might exceed the

capacities of the individual database

and less of a scaling reason but there

may be a reason that separate tenants

need to reside on different physical

databases for compliance reasons our

application will then add the relevant

data to the relevant charge and

therefore make our system more scalable

beyond the constraints of an individual

database if you're using Azure sequel we

do offer the azure elastic database

tools which gives you a number of tools

for creating maintaining and querying

sharded sequel databases in Azure from

within your application logic so let's

say that we've done all that we've taken

our product service with scaled to

compute and made it more available in

the process we also added an azure cash

for redish to improve our performance

and with scaled our sequel database by

sharding as tywin traders business goes

from strength to strength

surely the next step must be to go

global but there are some considerations

always take into account before you

think about going global firstly do we

really need to go global we need to

understand the pain that our customers

have before taking on such a task a few

questions to ask first can we get closer

to our end users for a content delivery

network can we get out to the edge and

serve our customers around the world

with static content

would it be more suitable to run two

independent systems one in the US and

one in the UK and another in Australia

for example what are the consistency

requirements of the data strong

consistency across the globe is hard if

not pretty much impossible so we need to

look at the consistency models of our

database let's talk a bit about data

consistency consistency in database

systems refers to the requirement that

any given database transaction must

change affected data only in allowed

ways for example strong consistency

offers a linearize ability of guarantee

which basically means that the reads are

guaranteed to return the most recent

committed version of an item an eventual

consistency where stuff gets a little

less well consistent

there's no ordering guarantee for reads

in the absence of any further writes the

replicas eventually conserved doing

cross regions sequel is pretty hard

cosmos DB makes it pretty easy for no

sequel you can go global within a few

clicks but remember what we just said

strong consistency does have its limits

so if you do really need to find if you

do really find a need to scale your

application globally there are some

major services that can help you achieve

that let's look at Asia front door and

as your traffic manager as a traffic

manager is a global DNS base load

balanced service this means that it uses

DNS and health probes to route your

users to the best healthy back end based

on the routing policies that you define

these routing policies could be based on

performance location round-robin etc

once a healthy back end is identified

clients always connect directly to the

back end as your front door service on

the other hand is an application

delivery network as a service it offers

various layer 7 level low balancing

capabilities for your apps it gives you

dynamic site acceleration along with

global load balancing with near

real-time failover it's a highly

available and scalable service we

fully managed by nature it's basically a

global HTTP based load balancer with

front-door the client establishes the

connection with front door itself so

front door is proxy in the users request

if the item requested isn't in the cache

the correct routing rule will be

identified then it will check the help

health probe of a relevant back-end and

assuming everything is healthy the users

request will be forwarded to the best

back end based on the routing method

because the connection is proxied by

front door we can perform some more

advanced features such as running a web

application firewall as well as caching

content which is really helpful for

scaling both of which we can't achieve

with traffic manager in this diagram we

can see here that you might actually

choose to use both traffic manager for

simple DNS base load balancing to our

static assets in our storage accounts

and as a front door for path based

routing on our web applications across

both app service and virtual machines in

this example here now we could do a

whole talk one has a front door and

we're not going to do that here for that

head over to or if it's already happened

watch VR k2 on for six taking

applications and contents at the edge

here at night which will dive much

deeper but I wanted to show you just how

front door can help you scale so if we

go back to our azure portal and we look

at front doors you can see that we had

this tau in traders front door here we

can look at the front door designer

which shows us what's happening so we

have one individual host this is

basically the endpoint for our front

door and then we have some back-end

pulls these are pause of backends you

can see the Europe one here has a couple

of app service backends this one also

has a couple of azure websites of doing

something slightly different and you can

see that then we then have a routing

rule that says based on this particular

condition what do we want to happen so

the main one here says that for slash

star for pretty much everything we want

to route back to the back end pool which

is twt Europe we're going to only allow

HTTP and more importantly with enabled

caching here we actually want to cache

every single unique URL we're not going

to change to strip the query strings

which is what is a feature that is

available

within the front door but you can see

that we then abled cashing here on the

edge that's literally all we need to do

to enable static content caching okay so

if we go over to the azure portal we can

search for monitor head back over to

those metrics that we saw earlier we can

select a particular resource in this

case we're going to select only front

doors because we're interesting in our

batch of front doors and also interested

in app services

so we can actually select our Tower

Wynne traders front door here which we

just saw we can actually say we want to

see what the request count is anyone to

add another metric which isn't going to

be for our front door we're gonna pick a

different resource which is gonna be our

one of our backends in the pool and

we're going to select requests and then

we're going to add another metric which

is actually going to be for our second

app service and we're going to look at

the request so what we're looking at

here is both our as a front door the

amount of requests that hit in the front

door versus the amount of requests that

are hitting our actual back-end so you

can see here that actually we've had a

peak of traffic just now and there's

very little traffic going to our front

to our backends the two at the bottom

here and most of the load that we're

having during this particular load test

I've been running here it's being served

via the azure front door this is because

our data is being cached and everything

is being served straight away so that's

just a really good example of how we can

leverage caching in Asia front door to

make our service much more reliable and

ultimately much more scalable so after

reviewing our costs understanding our

limits and what we need to manually

scale anything as well as

re-architecting all of our services to

be more scalable and reliable will

hopefully be able to survive the launch

of the electric hammer and we fixed a

number of the issues that we've seen

here so to summarize what we've

discussed today could you leverage an

inherently scalable cloud service

instead should you fix the bug first or

scale out the resources are you able to

scale your app horizontally do you need

to make changes to allow that to happen

are you able to decoupling using queues

or caching help when scaling out your

service are you leveraging availability

zones to make your system more reliable

and do you really need to go global and

when planning for growth are you aware

of your service limits can you

plan for scowl using capacity planning

like we've discussed today and can you

predict your future cloud spend so some

things to take away and to think about

your environment and how you could

prepare a plan and prepare for growth

just a reminder that for Docs you can

head over to the azure architecture

center and you can learn what's

happening there you can all head over to

ms learn there's a great tool great

learning path called architects and

great solutions in Asia and don't forget

why you're here at ignite or online you

can get certified for free and there's a

three exam if you check it out over here

and I'll leave the picture up here with

the resources for you to see and some

resources that you can take away from

this session and look including all the

demos objection they're all available

for you so thank you for watching

🔙 [Train The Trainer Kit](README.md)