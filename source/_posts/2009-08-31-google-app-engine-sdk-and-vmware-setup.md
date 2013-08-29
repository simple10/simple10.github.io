---
author: joe
date: 2009-08-31 21:50:19
layout: post
title: Google App Engine SDK and VMWare Setup
categories:
- dev
tags:
- google app engine
- localdev
- vps
---

1. VMWare network: bridged
2. OSX firewall: make sure to allow incoming connections to Python
3. Start dev_appserver.py manually (not with the GUI)

```bash
# Start dev_appserver.py
sudo /usr/local/bin/dev_appserver.py -a 192.168.0.50 -p 80 [Path to App]

# example:
# sudo /usr/local/bin/dev_appserver.py -a 192.168.0.50 -p 80 app/
```

Python (192.168.0.50) and VMWare can now connect to each other. Hooray for debugging!
