---
author: joe
comments: true
date: 2009-08-31 21:50:19
layout: post
slug: google-app-engine-sdk-and-vmware-setup
title: Google App Engine SDK and VMWare Setup
wordpress_id: 101
categories:
- misc
tags:
- google app engine
- linux
- localdev
---

VMWare network: bridged

OSX firewall: make sure to allow incoming connections to Python

Start dev_appserver.py manually (not with the GUI) with the following ...

sudo /usr/local/bin/dev_appserver.py -a 192.168.0.50 -p 80 [Path to App]

e.g. sudo /usr/local/bin/dev_appserver.py -a 192.168.0.50 -p 80 newdreamop/

Python (192.168.0.50) and VMWare can now connect to each other.  Yay for debugging!
