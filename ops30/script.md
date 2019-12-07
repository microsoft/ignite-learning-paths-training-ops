# OPS30 Main Script

## Background

This is the main script for the talk (the talk track to accompany the slides).

### Pre-Requisites

There are three demos in this talk ([demo script 1](../demos/demo1.md), [demo script 2](../demos/demo2.md), [demo script 3](../demos/demo3.md). Our current recommendation is to deliver these demos from the recorded videos as we work to strip down the requirements necessary to give a live demo from your own deployment. Recordings for all demos suitable for presentation are embedded in the [slide deck](../presentations.md).

## Script

Slide: 5
Resources

Let's get started.

Now is a good opportunity to take a picture of this slide so that you have
links to all the resources I'll be sharing not only in this presentation,
but across all the talks that you're going to be participating in here at
"Ignite the Tour".

And I'll show this slide at the very end as well If you miss it.

----

Slide: 6
OPS30: Learning from failure

Good morning, I'm {YOUR NAME HERE}. Today I'm going to share some thoughts
with you about how we can learn more from incidents.

Almost all of us work on teams that manage production services, and those
services have production outages.

Perhaps you have the same feeling that I have often had in the past,
that postmortems and RCAs tend to be more of a chore than an exercise of
great value.

Perhaps you have the same kinds of incidents over and over again?

Perhaps you feel like there's a fundamental conflict between the ingenuity
and intelligence and improvisation needed to run a service in practice,
and the idea that we can categorize every incident as having one of eight
root causes?

If so, this talk is for you.

----

Slide: 7

I'm going to start today with a story. I'm not going to tell you the whole
story right away. I'll tell you the first half of the story, and we'll
return to the second half later in the talk.

During WWII, this aircraft, the B17 "Flying Fortress", was involved in a
series of accidents. We don't know all of the details of these accidents,
and we don't know exactly how many there were. It was war-time, and many of
the details were secret and remain secret. What we know is that there were
a significant number of similar incidents, involving many individual
aircraft and -- if it helps when talking about such a serious topic -- we
can be almost certain that nobody was gravely injured in any of them.

In each case what would happen is this: A B-17 would come in to land, would
land successfully, and then either on the runway, or taxiing back to the
hanger, something strange would happen. Something serious would happen.
Something that wasn't supposed to ever happen would happen, and that's what
you see on the screen. The B17 would be on the ground and all of a sudden
the landing gear would suddenly retract, and the plane would collapse onto
the runway.

In each case, the investigators would look for evidence of mechanical or
electrical failure, and in each case they couldn't find any. So what they
concluded was that this was a case of pilot error, that the pilots had
mistakenly retracted the landing gear.

I don't know about you, but that seems like a very...unsatisfying answer.

Does this story raise questions in your mind? We'll come back to it, but
for now, here's two additional pieces of information: The investigators
were correct: no mechanical or electrical failures had occurred. The
accidents kept happening.

I'm going to propose that something is missing in this conclusion, and in
the investigations that led to it.

----

Slide: 8
Here's our map

Let's put this talk to perspective by seeing how it fits into the larger
learning path. If you were in OPS10 or OPS20, this will look familiar. To
help you improve reliability in your organization using modern operations
practices, we are offering you a map--what to do and in what order.

----

Slide: 9
Here's our map

The map for the LP is based on something from the site reliability
engineering world called the Dickerson hierarchy of reliability. Mike
Dickerson was an SRE who became the founding administrator of the United
States Digital Services. He created this hierarchy while he was facing one
the largest reliability crisis he had ever been asked to address. It is a
riff on Maslow's hierarchy of needs. Like Maslow's hierarchy, the idea is
that there are a set of levels. For us to progress up the pyramid, we need
to make sure that each of the lower levels are solid first. Let's look at
the levels in this hierarchy.

----

Slide: 10

----

Slide: 11

It consists of monitoring.

----

Slide: 12

Responding to incidents

----

Slide: 13

Learning from those incidents

----

Slide: 14

Creating processes that help you avoid incidents before they happen

----

Slide: 15

And finally dealing with growth because success can threaten reliability
just as much as failures can.

----

Slide: 16

Dickerson suggests two more layers, the development process and the user
experience aspects that we won't cover here.

----

Slide: 17

And so welcome to the OPS learning path. Each of the sessions of this path,
OPS10, 20, 30, 40 and 50 directly address a level in this hierarchy.

----

Slide: 18

----

Slide: 19
Agenda

What are we going to cover today?

First, we're going to consider a question: why should we want to learn more
from incidents?

The answer may seem obvious to you, but I have a twist I want you to
consider.

*Click*

We then need to set a baseline for what should and more importantly what
shouldn't happen in a post-incident review for it to be effective.

Then, we're then going to talk about four common traps that we all fall
into during incident investigations.

These traps are traps identified by a community of researchers who have
studied systems like ours in other industries. We'll hear more about
them later.

*Click*

Last, we'll discuss several practices you can introduce to help improve
your own ability to learn from failure

----

Slide: 20
Why should we learn from incidents?

----

Slide: 21

Here's the thing: most of the systems we work on, especially in a cloud
environment, are complex systems.

They're composed of many parts, and often the behavior of the system comes
from the interactions between those parts as much as from the parts
themselves.

Complex systems behave in interesting and counterintuitive ways. And, I'm
sorry to say, they're never 100% reliable.

This gentleman on the left is Dr Richard Cook. He is an anesthesiologist
and researcher who has spent decades working on safety in complex systems,
specifically patient safety in the healthcare system.

In his paper "How Complex Systems Fail" which I strongly encourage you to
read, he explains what is common to complex systems in all fields from
healthcare to software operations. There are a few key points I want to
focus the discussion on.

----

Slide: 22

"Complex systems contain changing mixture of failures latent within them"

Your system is never fully functioning.

----

Slide: 23

"Complex systems run in degraded mode"

Your system "works" in that state.

----

Slide: 24

"Catastrophe is always just around the corner"

The complexity of these systems means that major system failures are -- in
the long term -- unavoidable.

So what does this mean for us?

It means that there are TWO THINGS for us to think about.

----

Slide: 25

Prevention - on the one hand.

But also, since things will eventually and inevitably go wrong, our ability
to respond on the other.

These things are interlinked, connected. Has anyone ever introduced an
automated system which worked most of the time, but when it failed, it
failed spectacularly, and made it harder for operators to understand what
had gone wrong?

This may seem obvious to you now that I've said it, but there is a deeper
realization here... The systems we work on are not just technical systems.
In fact, we don't work "on" the system, we work "in" the system. Our
systems are systems that include humans, and how the humans respond when
things go wrong is AS important as preventing things from going wrong in
the first place.

----

Slide: 26

And because our systems include humans, that leads us to a conclusion that
may be uncomfortable for some.

Language matters. You'll see in this talk that we will be very specific
about what terms we use and what ones we intentionally don't use.

The words we use affect how we think about what happened, and can
drastically change what, and how much we learn. This finding comes from
research in safety-critical industries such as aviation, medicine, search
and rescue, firefighting, and more.

Collectively, this field of research has become known as Resilience
Engineering.

We have a lot to learn about Resilience Engineering in the tech sector.
Later in this talk and we'll share with you some really useful stuff we've
learned from the RE literature including four of the most common traps
people fall into when attempting to learn from failure, but first we need
to define some terms and make sure we are all on the same page.

----

Slide: 27
Post-incident Review Baselines

Some of this will be obvious to people, some of it will be new. This
section of the talk will allow us to level set so we are all on the
same page. We will also show you a few demos of Azure things you
probably haven't seen before to make this part of the discussion
interesting to everyone.

----

Slide: 28
Lifecycle of an incident

Incidents have a lifecycle. It goes from (*click through*)

The post-incident
review happens during the analysis phase. And just to be clear it is as
much part of the incident response is as any other part.

----

Slide: 29
So what's the big idea?

----

Slide: 30
So what's the big idea?

Some people call it post-incident learning review

----

Slide: 31
So what's the big idea?

Some people call it ...

----

Slide: 32
So what's the big idea?

Some people call it ...

----

Slide: 33
So what's the big idea?

Many people do this by getting everyone into a room who had any connection
to the incident, some people choose to create it via individual interviews
and then report back to the group. That often works better when group
settings in your org are more difficult because of group dynamics or
personalities. Do what works for your org. But a key thing is...

----

Slide: 34
So what's the big idea?

Because humans forget things.

----

Slide: 35
So what's the big idea?

Yes, we may be generating action items, but that will be a side effect of
the process.

----

Slide: 36
So what's the big idea?

The focus is on the technology and the process, not the people. What was
the deficit in our monitoring that didn't give the person at the keyboard
the necessary context to make the right decision. Why did we have a "nuke
the entire datacenter" option in our tooling that didn't ask for
confirmation?

We will be very clear about this later in the talk as well.But here's an
important point...

----

Slide: 37
You can't fire your way to reliability.

Shame and blame, finding the person who is "responsible" and firing them
will not lead to reliable systems. It will lead you to an empty team.

----

Slide: 38
So what's the big idea?

A review is not a technical process as much as it is a people process.
People have different perspectives, and those perspectives will be
invaluable to the learning process.

----

Slide: 39
A post-incidentreview is NOT...

It's not a report

It's a conversation to review what we know and knew. So that we may learn
more about our systems (especially how humans & the system) work together
(or don't) in the response to problems.

If a summary repot comes from it, so be it. If action items come from
it, fantastic. If neither area result but more is known about the
system. It was successful. But that is not the focus or intent of a post-
incident review.

We are here to LEARN!

----

Slide: 40
So what's the big idea?

A key part of this will be the construction of a shared, accurate
chronology that reflects the non-linear nature of an incident. By non-
linear, I mean that an incidents are almost never just "this happens, and
then that happened, then we noticed, then we did something, and then we are
done". People come in and out, different people notice and try different
things, some work, some don't. And if multiple people are working at the
same time, these things can happen at the same time too. So it is a bit
more complicated.

But in order to get a handle on this, we need to start some place. Well,
the first step is:

----

Slide: 41
Step 1: Gather the data

Our first step before conducting a learning review is to gather data.
Specifically, we will want to collect as much of the conversation as we can
so we can use all of the crucial data in it. The conversation that happened
during the outage will be one of our richest sources of information.

We will want to do what we can to gather from our monitoring system and
other places the context that the people involved in the incident had. What
information were they getting from our systems when this was going on?

And finally, if possible, it will be helpful for us to get a better picture
about what changed just prior and during the incident because changes are
often part of the contributing factors when an incident happens.

Let's see a demo for each of these processes.

----

Slide: 42
Collect the Conversation

DEMO 1: Microsoft Graph to export teams
DEMO 2: Working with dashboards and JSON
DEMO 3: Log analytics and the audit log

----

Slide: 43

----

Slide: 44
Determine the Context

DEMO 1: Microsoft Graph to export teams
DEMO 2: Working with dashboards and JSON
DEMO 3: Log analytics and the audit log

----

Slide: 45

----

Slide: 46
Find the Changes

DEMO 1: Microsoft Graph to export teams
DEMO 2: Working with dashboards and JSON
DEMO 3: Log analytics and the audit log

----

Slide: 47

----

Slide: 48
Four Common Traps

Now that we've gathered the data we are going to need for our review, we
can get back to the four common traps we mentioned earlier, but first let's
revisit the story of the B-17

----

Slide: 49

Back at the beginning I asked you if you were satisfied with the
explanation of pilot error.

This man was not. Alphonse Chapanis (Cha-pa-nees) was a military
psychologist who was asked by the US Air Force to investigate these
incidents.

He noticed, among other things, that these accidents were unique to the B-
17 and a small number of other aircraft. There were thousands of C-47
transport aircraft in use in Western Europe at the same time, yet no C-47
had ever experienced a similar incident.

So he interviewed pilots. And he based on what he heard from the pilots, he
went and looked at the B-17 cockpits. And this is what he found.

----

Slide: 50

This is the central console. On the left is the original Boeing diagram,
and on the right is the modern reproduction.

Circled in yellow, and you can almost make out the labels on the right, are
the gears switch and the flaps switch.

The switches are about 3 inches apart from one another in the cockpit,
their mode of operation is identical, and if you've just landed a plane,
your flaps are going to be extended, and before you park you are going to
retract them.

They were simply too easy to confuse for one another, and that's what had
happened in these incidents. And so Chapanis tried something different.

He glued a little rubber wheel to the switch for the gear, and a hard
angular "flap" to the switch for the flaps, and sure enough the accidents
stopped happening.

He's now known as one of the founders of the field of ergonomics -- the
study of design factors in human performance -- and he had a simple
observation -- that the design of the cockpit could affect the
likelihood of human error. This has gone on to inform the design of all
modern aircraft.

----

Slide: 51


This is what the gear and flaps controls look like in an Airbus A320. On
the left you see the gear, shaped like a wheel, and on the right you see
the flap. Their design is now mandated by federal law in the US.

----

Slide: 52
Trap 1: Attribution to "human error"

I share this story to make the single most important point we have for
you today.

Humans do make mistakes, but "human error" is a symptom and not a cause.

----

Slide: 53
Trap 1: Attribution to "human error"

Symptoms of issues with... system design, organizational design, personal
context, and so on.

*Click*

Human error is problematic in investigations, because it causes us to lose
sight of the fact that what the human did made sense to them at the time.
They didn't intend to make a mistake.

*Click*

So when we see or hear "human error", it is a signal that we need to
look deeper.

*Click*

If we want to learn, we must not stop investigating when we find a
human error, as we so often do. As the story of the B-17s demonstrates,
just beyond the human error is where we learn interesting things about
our system.

----

Slide: 54
Trap 2: Counterfactual reasoning

The second trap is counterfactual reasoning. You might not know what
counterfactual reasoning is, but you've definitely heard it before.

----

Slide: 55
Trap 2: Counterfactual reasoning

If you hear someone say, 'should have', 'could have', 'would have', or
someone says that a system 'failed to' do something, that's counterfactual
reasoning.

*Click*

In all these cases, what is happening is that we are telling a story about
a series of events that did not occur, in order to explain a series of
events that did. When you put it like that, it sounds pretty silly.

*Click*

Here are some more examples of counterfactual language.
'the monitoring system failed to detect the problem',
'the engineer did not check the validity of the configuration'.

The problem with counterfactual reasoning is this: if we focus on things
that didn't happen, it takes time and thought away from understanding how
what happened, happened.

----

Slide: 56
Trap 3: Normative language

Trap number three is the use of "normative language".

----

Slide: 57
Trap 3: Normative language

Normative language often implies that there was an "obviously-correct"
course of action that operators should have taken and judges the actions of
those operators with the benefit of hindsight.

*Click*

Normative language can be harder to detect, but often adverbs give the game
away. When someone says that something was done "inadequately" or
"carelessly" or "hastily," that is normative language

*Click*

Decisions are often judged based on their outcomes, which is perverse, as
the outcome is the 1 piece of information that was unavailable to the
operator at the time they made their decision.

----

Slide: 58
Trap 3: Normative language

Side note: Normative language can also be used in the opposite sense.
People can praise operators for having acted "appropriately," for example.
But again, often this judgment is made with the benefit of information the
people in question did not have.

The problem with normative language is similar to the problem with
counterfactual reasoning: if we accept the post-hoc judgments, made with
information that was unavailable to the humans involved during the
incident, we will probably neglect to understand how their decisions made
sense to them at the time. Because they did! If they hadn't, they wouldn't
have made them. Which brings to our fourth trap.

----

Slide: 59
Trap 4: Mechanistic reasoning

[ROUGHLY HALF-WAY]

Our fourth trap is what a former Microsoft person Jessica DeVita likes to
call the "meddling kids" trap, and it is "mechanistic reasoning."

----

Slide: 60
Trap 4: Mechanistic reasoning

Mechanistic reasoning is built on the fallacy that we work on systems that
are basically functioning correctly, and if only those meddling kids hadn't
gone and done that thing, everything would have been fine.

The problem here is that this is simply not how our systems work.

*Click*

Let's have a quick moment of audience participation here. If you work on a
production service, please put your hand in the air. Now imagine the
following scenario: everything outside your team continues just as before.
Customers continue to use your service. External dependencies continue to
change. The internet keeps on internetting.

But I'm going to tell you that you can't touch your service. No
deployments, no config changes, no control plane operations. Nothing.
You aren't allowed to make any change to the code or configuration of
your service.

Ok? Now, please keep your hand in the air if your service would still be
running as expected a day later. A week later? A month later? A year later?

*Click*

----

Slide: 61
Trap 4: Mechanistic reasoning

What you've all just demonstrated is that the only reason our systems are
up in the first place is because of the actions of humans in the control
loop. It's only through human action and capacity to adapt to changing
circumstances that the system works.

So it's pretty silly to conclude the system was "basically working... if it
hadn't been for those meddling kids."

So the problem with mechanistic reasoning is that it leads us down a path
where we believe that finding the faulty human is equivalent to finding the
problem. Unfortunately, that same faulty human has been improvising and
adapting to keep the system running for weeks and months, so perhaps
there's more to look at.

----

Slide: 62
Four Helpful Practices

So I hope I've given some examples of how the language you use and the
questions you choose to ask can be really important in determining how much
you learn when investigating. And we've identified a few traps to avoid
falling into. Hopefully you are now asking "what should I do instead" so in
addition to the four traps to avoid we now have a couple things for you to
do and take back to your teams.

----

Slide: 63
Practice 1:Run a facilitated post-incident review

Run a facilitated post-incident review meeting. A single on-call engineer
writing up a postmortem on their own will usually not learn that much.

----

Slide: 64

1. Run a facilitated post-incident review

** Get participants into a meeting. Review the timeline.

** These meetings don't have to be -- shouldn't be -- marathons. Most of
the time, you shouldn't go over an hour. 90 minutes is the longest most of
us can concentrate and participate effectively in a meeting.

** It's important that if possible, your facilitator wasn't involved in
the response to this incident. You'll learn more if the person
facilitating cannot be seen to have a personal agenda in telling the story
of the incident.

** If you're concerned about being able to make effective use of this
time, it can help for your facilitator to prepare by interviewing some of
the responding team 1:1 to get an overview of what would be interesting to
ask about.

** You don't have to do this for every incident. Start small. Once a month.
Maybe start with smaller incidents.

----

Slide: 65
Practice 2:Ask better questions

Our next helpful practice: ask better questions.

----

Slide: 66
2. Ask better questions

** As we talked about: language matters. Asking "why" questions will often
put people on the defensive. You should probably prefer "how" questions.

Don't ask "why did you do that?" Instead, ask "what factored into your
decision to make that change?" Don't ask "why wasn't this caught in
canary?" Instead, ask "how effective is canary at catching this sort of
issue, usually?"

** Remember that each participant in the incident is likely to have had a
slightly different view on events. Ask questions that expose these multiple
views and interpretations.

** You will often learn as much by asking about how work "normally" happens
as you will by asking about the specific incident in question.

** For many more suggestions on how to ask better questions, we recommend
reading the Etsy Debriefing Facilitation Guide.

----

Slide: 67
Practice 3:Ask how things went right

Our third recommendation builds on key insights from RE community.

Ask about how things went right. Far from our view of incidents as one-
offs/products of extreme conditions: in most complex systems things go
wrong for many of the same reasons they go right.

So remember: pay attention to how things went right, too.

----

Slide: 68
3. Ask how things went right

** Don't just ask about how the outage happened. Ask about how we
recovered, too.

** What insights or skills were used to get the system back to working?
What tools were useful?

** Was there a critical moment when someone shared a piece of information
that helped unlock the puzzle of what was happening? Ask: how did they know
to do that? Where did the information come from?

** This comes back to what we said at the very beginning: we have as much
to learn about how to improve our ability respond, as we do about how to
prevent outages.

----

Slide: 69
Practice 4:Keep review and planning meetings separate

And so to our fourth recommendation, which is about when to discuss
repair items.

----

Slide: 70
4. Keep review and planning meetings separate

** You need to keep discussion of repair items out of your post-incident
review, otherwise they'll act as a distraction from the purpose of that
meeting.

** We suggest that you discuss repair items in a separate meeting a day or
two after your post-incident review. Perhaps with a smaller group.

This will help you in two ways.
** First, it will help you in the PIR: it's easier to avoid jumping to
conclusions if you're not focused on how to fix it. You can keep the focus
on understanding what actually happened.

** Second, allowing a day or two of soak time will help you to identify the
most "energy-efficient" repair items -- minimum energy for maximum impact.
Your subconscious can help you... you just need to give it time.

----

Slide: 71
To Review

** Exposing multiple viewpoints; allowing participants to learn from
one another.

** Avoiding defensiveness; putting the focus on what happened rather than
what didn't.

** Revealing how to strengthen our response capabilities.

** Keeping the focus on the timeline in the PIR, providing "soak time" _
better action items.

----

Slide: 72
Epilogue

Ok, let's draw this session to a close.

----

Slide: 73

First: we will always have incidents. 100% reliability is not achievable in
a complex system.

That means that our ability to respond effectively will always be
important, alongside ongoing work on incident prevention.

----

Slide: 74

Second: "human error" is a label, and not a very helpful one at that.

A symptom. Not a cause.

We learn only when we seek to understand how what happened, happened.

----

Slide: 75

And finally: a facilitated post-incident review is one of the best tools we
know about for learning from incidents.

You don't have to jump all the way in, you can ease your team into the
process by choosing to review the incidents that make sense and ramping up
from there.

At its most effective, it can expose not only what went wrong, but what
went right, and how we can build on that.

----

Slide: 76

----

Slide: 77
/MS Learn alert

----

Slide: 78
/Upcoming session alert

----

Slide: 79

----

Slide: 80
Resources

----

Slide: 81
OPS30: Learning from failure

----

Slide: 82
Special thanks to ...

Nick Stenning .. for providing the core talk this sessions is based
including most of the slides and talking points.

Jessica Devita .. for support and guidance in Resiliency Engineering topics

Dr. Richard Cook .. for his work in the field of resiliency engineering,
human factors and for sharing the paper "How Complex Systems Fail".

John Allspaw .. for his work in the field of Resiliency Engineering,
Adaptive Capacity, mechanistic reasoning, and his advocacy for these topics
in the operations space
