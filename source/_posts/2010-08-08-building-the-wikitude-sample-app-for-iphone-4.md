---
author: joe
date: 2010-08-08 20:58:28
layout: post
permalink: building-the-wikitude-sample-app-for-iphone-4
comments_id: 133 http://www.simple10.com/?p=133
title: Building the Wikitude Sample App for iPhone 4
categories:
- dev
tags:
- iphone
- xcode
---

I'm new to iPhone development but wanted to see how quickly I could build an augmented reality prototype for a simple AR treasure hunt game. I looked at the APIs for [Layar](http://site.layar.com/create/platform-overview/), [ARToolKit](http://artoolworks.com/Home.html), [Junaio](http://www.junaio.com/), and settled on [Wikitude](http://www.wikitude.org/enwikitude-iphone-api) for this test. Wikitude provides an augmented reality library that you can drop into your iPhone project in less than an hour. Bad ass. Assuming you're not an iPhone dev n00b like me. Then it takes you three hours.

If you've never tried to build a downloaded sample app, hopefully this guide will save you a couple hours of futzing around with plist and project configuration.

I'm using XCode 3.2.3 with the iOS SDK 4.0.1 and targeting an iPhone 4 device connected to my MacBook Pro.

## Getting Started

1. Download the [Wikitude iPhone API](http://www.wikitude.org/developers) and unzip the sample app
2. Open WikitudeAPI-SCM-Test.xcodeproj in XCode
3. Click "Build and Run" on the XCode toolbar

You'll probably get one or more of the following errors:

```text
There is no SDK with the name or path 'iphoneos3.1.2'.

Code Sign error: a valid provisioning profile matching the application's Identifier 'com.companyname.productname' could not be found
```

Time for to fix the sample app configuration. Search paths, target architecture, base SDK, and code signing will all need to be changed in order to successfully build the project.

Before you go any further, make sure you're set up through the [iPhone Dev Center Provisioning Portal](https://developer.apple.com/iphone/manage/overview/index.action) to sign code. The Wikitude API will not run in a simulator, and building for devices requires a valid code signing identity. You can apparently use the XCode Organizer to create your code signing profiles. However, I kept getting an unexpected error and ended up doing everything through the web portal. For simplicity, I created a wildcard domain (com.simple10.*) for the App ID so that I can use the same provisioning profile for other apps.

Once your provisioning profile is ready to go, it's time to fix the XCode project configuration so the sample app will build.

## Fixing Config Options in XCode

Open the project info build options panel by double clicking on WikitudeAPI-SCM-Test project.

[![Wikitude Sample App Configuration](/images/posts/wikitude_sample_config_screen1.png)](/images/posts/wikitude_sample_config_screen1.png)

Make the following changes to the build options...

### Architectures

* Architectures: Standard (armv6 armv7)
* Base SDK: iPhone Device 4.0
* Build Active Architecture Only: [checked]


### Code Signing

* Code Signing Identity > Any iPhone OS Device: [select your provisioned profile]

Open the targets build option panel by expanding the Targets tree and double clicking on WikitudeAPI-SCM-Test.

[![Wikitude Sample App Config Screen 2](/images/posts/wikitude_sample_config_screen2.png)](/images/posts/wikitude_sample_config_screen2.png)

Make the following changes to the target build options...

### Search Paths > Library Search Paths

* Remove "$(SRCROOT)/../WikitudeAPI-SCM/build/Debug-iphoneos"
* Remove "$(SRCROOT)/../../../Desktop/WikitudeAPI"


Open WikitudeAPI_SCM_Test-Info.plist and edit the bundler identifier to match the domain used in your provisioning profile.

[![Wikitude Sample App Screen 3](/images/posts/wikitude_sample_config_screen3.png)](/images/posts/wikitude_sample_config_screen3.png)

Finally, make sure that Active Architecture setting in the build target drop down menu is set to armv6.

[![Wikitude Sample App Screen 4](/images/posts/wikitude_sample_config_screen4.png)](/images/posts/wikitude_sample_config_screen4.png)

Click Build and Run. The app should build, deploy, and automatically run on your connected iPhone.
