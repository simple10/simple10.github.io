---
author: joe
date: 2010-08-09 20:45:47
layout: post
permalink: ape-comet-server-local-dev-environment-setup
comments_id: 147 http://www.simple10.com/?p=147
title: APE Comet Server Local Dev Environment Setup
categories:
- dev
tags:
- comet
- localdev
---

[APE (Ajax Push Engine)](http://www.ape-project.org) is a scalable comet or AJAX push server written in C. It's great for embedding HTML chat clients or making real-time games without Flash.

I've been playing around with APE for a couple different applications. Setting up the demos on a single server that runs both Apache and the APE server is relatively straight forward. However, running the APE server separate from the web server is not as simple.

Here's my dev environment...
 
* **Web server:** Ruby on Rails running locally on my mac at http://0.0.0.0:3000
* **APE server:** running in a Debian VMWare server at http://192.168.0.99:6969

The production environment is similar with [Heroku](http://heroku.com) as the web server and [Linode](http://www.linode.com) running the APE server.

Here's what you have to do to get the dev environment setup from scratch...

1. Download [APE Project](http://www.ape-project.org/download/APE_Complete_Package.html)
2. Follow the [APE doc](http://www.ape-project.org/wiki/index.php/Setup) for installing the server
3. Create a new rails project and copy the ape-jsf folder into your rails project's public dir
4. Edit /etc/hosts on your mac and add the entries below
5. Edit ape-jsf/Demos/config.js as directed below
6. Modify JS Request methods to use GET instead of POST


### Add to /etc/hosts

```bash
192.168.0.99 ape.dummy-domain.com
192.168.0.99 0.ape.dummy-domain.com
192.168.0.99 1.ape.dummy-domain.com
192.168.0.99 2.ape.dummy-domain.com
192.168.0.99 3.ape.dummy-domain.com
192.168.0.99 4.ape.dummy-domain.com
192.168.0.99 5.ape.dummy-domain.com
192.168.0.99 6.ape.dummy-domain.com
192.168.0.99 7.ape.dummy-domain.com
192.168.0.99 8.ape.dummy-domain.com
192.168.0.99 9.ape.dummy-domain.com

0.0.0.0 dummy-domain.com
```

### Edit ape-jsf/Demos/config.js

```javascript
APE.Config.baseUrl = 'http://dummy-domain.com:3000/ape-jsf'; //APE JSF
APE.Config.domain = 'auto';
APE.Config.server = 'ape.dummy-domain.com:6969'; //APE server URL
```

Last but not least, edit ape-jsf/Tools/Check/index.html and modify all Request calls to use GET instead of POST. By default, MooTools Request object uses POST for XHR requests which will cause a problem with Rails.

```javascript
this.addTest('Loading Client', function() {
  var req = new Request({
   'url': '../../Clients/MooTools.js',
   'method': 'GET',
   'evalResponse': true,
   'onComplete': function(resp) {
    if (window.APE) this.fireEvent('testComplete', {'sucess': true});
    else this.fireEvent('testComplete', {'error': "Can't load client, check the file " + window.location.href.replace('/Tools/Check/', '') + "/Clients/MooTools.js is available"});
   }.bind(this)
  }).send();
}.bind(this));
```

The test script should now run properly at http://dummy-domain.com:3000/ape-jsf/Toosl/Check/

APE uses iframe and JSONP hacks to transparently handle javascript subdomain security issues.

If you look at what's going on in Firebug, you'll see APE embedding an iframe in the page, setting the iframe domain to dummy-domain.com, and making calls to the APE server through iframe. This trick only works if the main HTML page is on a different sub-domain than the APE server. It will not work for two completely different domains. This is a limitation of Javascript browser security and not APE.

Thanks to the APE dev team for making an awesome comet server!
