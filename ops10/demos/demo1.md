# OPS 10 Demo 1 Script - App Insights Application Map

## Background

* Note: This is the same script as found embedded in the [main](../scripts/main.md) file, just broken out for convenience.

## Before you Demo

### Deployment setup

This demo expects you to have spun up the demo environment, please see the [OPS LP deployment guide](../../deployment/README.md). At the end of the deployment, you should have the full tailwind traders application running. Note the step in the deployment instructions which suggests you look at the deployment logs. At the end of the logs, you will find out the URL for the running application so you can send traffic to it.

### Send some traffic

Notes:

* These instructions detail one way to send traffic to the application frontend and to the shopping cart backend service. Please feel free to use your favorite tool for this purpose, the following is just one suggestion.
* For the purpose of these demos, be sure to send a ratio of significantly more "good" traffic (successful requests) to the app than "bad" (error producing) traffic.
* Be sure to send this traffic in time for the demos. Right before the session is ideal, but not required. Just note that the application map (demo 1) has a default timeframe of 1hour (though it can be changed) and the KQL queries in demo 2 and 3 both have 5 hour time horizons so that the graph looks good. Adjust accordingly if desired.

#### Frontend traffic

First, we will send some "good" traffic to the web frontend using the Apache Bench tool (ab).

* Apache bench is included with later versions of OSX. No installation is is necessary.
* Windows users can download it either as part of the main Apache http distribution in the bin directory (for example at [Apache Lounge](https://www.apachelounge.com/download/)) or as part of the [XAMPP distribution](https://www.apachefriends.org/index.html)).
* Linux users can install it as part of the apache2-utils, httpd-tools, apr-util or similar Apache utils package depending on their distribution.

```
ab -n 500 http://URL_TO_YOUR_DEPLOYED_APP
```

For example:

```
ab -n 500 http://3a1d8c473f62432b88cb.southeastasia.aksapp.io
```

#### Shopping Cart traffic

Second we will need to send some "good" traffic to the shopping cart backend service. This is a little trickier in that we will need to send it traffic which it believes is coming from an authenticated source. To be seen as being authenticated, we must send traffic with the correct bearer token in our headers.

Here's one way to get a valid bearer token:

1. open a browser and browse to the ```URL_TO_YOUR_DEPLOYED_APP```
1. "Log out" if you are already logged in, then "Log in" (using fake credentials)
1. add something to your shopping cart
1. browse to your shopping cart
1. open the web inspector in your browser. You will see a number of requests going to "shopping cart" as in: ![Figure 1](./figure1.png)
1. if you click on any of these requests, you will see more info for that request. Scroll until you see the Request section. In that section, you will see an Authorization header listed as seen in: ![Figure 2](figure2.png).

    You will want to copy everything after the word "Bearer" for the next step (this is the *bearer token* we will need in the next step).

1. now we can use ab to send the shopping cart "good" traffic:

```
ab -n 200 -c 10 -H "Authorization: Token BEARERTOKENHERE" URL_TO_YOUR_DEPLOYED_APP/cart-api/shoppingcart
````

For example:

```
ab -n 200 -c 10 -H "Authorization: Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoic2Rmc2RAc2Rmc2YuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiYzdjMGYyZDctODA4My00MGU3LTkxNmEtOWYzZDFhNTNhOGVmIiwiZXhwIjoxNTcxNzYzMDQ2LCJpc3MiOiJUVEZha2VMb2dpbiJ9.x-SrTAGZi42g9mQ7NxjSIzhSjrJUvxn6cJosV9kXzXk" http://3a1d8c473f62432b88cb.southeastasia.aksapp.io/cart-api/shoppingcart
```

Next, we will want to send the service some "bad" or "error" traffic. We can do this in two ways to generate two different kinds of errors.

First, generate HTTP 401 (non-authorized traffic) by removing the authorization header (note that we are intentionally sending fewer error-causing requests than the previous "good" traffic):

```
ab -n 50 -c 10 URL_TO_YOUR_DEPLOYED_APP/cart-api/shoppingcart
```

Second, generate HTTP 404 errors (bad page request) by removing the 's' in "shoppingcart" in the URL:

```
ab -n 200 -c 10 -H "Authorization: Token BEARERTOKENHERE" URL_TO_YOUR_DEPLOYED_APP/cart-api/hoppingcart
```

For example:

```
ab -n 50 -c 10 -H "Authorization: Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoic2Rmc2RAc2Rmc2YuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiYzdjMGYyZDctODA4My00MGU3LTkxNmEtOWYzZDFhNTNhOGVmIiwiZXhwIjoxNTcxNzYzMDQ2LCJpc3MiOiJUVEZha2VMb2dpbiJ9.x-SrTAGZi42g9mQ7NxjSIzhSjrJUvxn6cJosV9kXzXk" http://3a1d8c473f62432b88cb.southeastasia.aksapp.io/cart-api/hoppingcart
```

## Script

Time for a demo. I’d like to show you two Azure offerings that can help you with this operational awareness. There are a number of components of operational awareness, but let’s focus on the deceptively simple question for the tailwind traders app: what’s actually running and how well is it doing?

For the first part of the demo, I’d like to show you one of my very favorite screens in the Azure monitor suite, the application map provided by Application Insights. If you have added the app insights hooks to your application , either by very simple stubs from the app insights SDKs (which usually just means adding a line or two of code) or the "turn on app insights" buttons within the portal, your application will start sending telemetry information to our collectors. Then magic can happen.

Tailwind traders has added these stubs in their app (by the way, did I mention their entire app is available on Github if you want to take a peek? There’s a pointer to this codebase in the resources available for this session). Let’s see just what using app insights gets us.

1. Resource Group -> tt-app-insights -> Application Map.
1. show various components of app.
1. point out stats on components.
1. Point out stats on arrow labels.
1. Click on connector, talk about stats.

So hopefully you can see why this Azure monitor feature excites me so much. It makes it really easy for me to understand just what components are in play, how they talk to each other, their performance, error rates, and so on. All from one screen. Just fabulous. We'll go into further detail about the application map in OPS20. I do want to give you one quick piece of advice about the Application Map before we move on to the second part of the demo: instrument your code and go look at this screen now. Get very familiar with it and all of the data it can offer you. Don’t wait until your next downtime and say "wait, what was that thing PRESENTER NAME HERE was talking about on stage back in CURRENT MONTH HERE? Where is it again in the portal?"
