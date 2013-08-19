---
author: joe
comments: true
date: 2013-03-13 23:52:31
layout: post
slug: ignore-jquery-jsonp-callbacks-in-mocha
title: Ignore jQuery JSONP Callbacks in Mocha
wordpress_id: 322
categories:
- jquery
- mocha
- node
---

[Mocha](http://visionmedia.github.com/mocha/) reports global variable leaks by default. If you're using jQuery to fetch JSONP data, mocha will report the random jQuery callback functions as leaks.

To make mocha ignore the JSONP callback functions, just add jQuery* to mocha's list of registered globals.

For the browser based version of mocha, register the globals using the setup method.

```javascript
mocha.setup({
  globals: ['jQuery*']
});
```

This little tip was not obvious to me in the mocha documentation and required digging through the code a bit.
