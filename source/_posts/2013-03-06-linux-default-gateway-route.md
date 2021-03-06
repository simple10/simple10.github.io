---
author: joe
date: 2013-03-06 19:21:44
layout: post
permalink: linux-default-gateway-route
title: Linux Default Gateway Route
categories:
- sysadmin
tags:
- networking
---

I only seem to run into this once a year and rarely remember what to do off the top of my head.

**Problem:** configuring and starting network interfaces on Linux (usually Debian / Ubuntu)

**Solution:** use ifup and ifdown, not ifconfig

The problem I ran into was caused by a network interface going down on a server. Bringing the network back up with `ifconfig eth0 up` works except for one tasty little detail: ifconfig does not set a default gateway route. And for the life of me, I couldn't remember where I was supposed to enable this route. I looked in `/etc/network/interfaces`, `/etc/network/if-*/*`, `/etc/rc.local`, etc. to no avail.

I ran `sudo route add default gw 192.168.0.1 eth0` to manually setup the route, but I still couldn't figure out the best practice for enabling this route on reboot.

Finally, I looked at `/etc/init.d/networking` and noticed it was using `ifup` instead of `ifconfig`. Running `ifup eth0` setup the correct default gateway route with no need for any manual configuration.

Useful commands:

```bash
lspci
netstat
sudo route -n
sudo route add default gw 192.168.0.1 eth0
```
