---
author: joe
comments: true
date: 2009-01-28 17:32:30
layout: post
slug: utf-8-json-php
title: UTF-8 + JSON + PHP
wordpress_id: 58
categories:
- code
tags:
- json
- php
- utf8
---

We were running into problems on the awakeningthedreamer.org site where international characters were causing an error. The problem was that the form values being sent through JSON were only being run through escape and not encodeURIComponent.

On the PHP side, incoming data needs to be decoded to ISO-8859-1 using utf8_decode unless the database, PHP string functions, and HTML header settings are all UTF-8 compatible.

```php
$data = json_decode(stripslashes($_REQUEST['data']), true);
// loop through data to convert to ISO-8859-1; comment out if using UTF-8
foreach ($data as $key =&gt; $value) {
    $data[$key] = utf8_decode($value);
}
```

In the end, UTF-8 is being stored in the database and displayed via the web.

I had to add the following to HTML header and make sure Apache headers were not specifying the character set.

```html
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
```

[PHP Cheatsheet](http://www.nicknettleton.com/zine/php/php-utf-8-cheatsheet)
