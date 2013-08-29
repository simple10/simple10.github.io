---
author: joe
date: 2011-07-07 22:56:09
layout: post
title: Rescuing from Rack::Timeout to Close MongoDB Connection
categories:
- code
tags:
- mongodb
- rails3
---

I'm using Rack::Timeout on Heroku to kill requests before Heroku's 30 second limit is reached. This helps applications play nice with cloud infrastructure but can cause some unexpected bugs with [MongoDB connections being reused](https://jira.mongodb.org/browse/RUBY-231?focusedCommentId=26045&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#action_26045) by the next request.

The errors showed up as...

```bash
Mongo::ConnectionFailure: Expected response 372 but got 371
```

Mongo ruby driver >=1.3 catches the reused request and raises an error, but this still means the first and next requests both returned errors. It's much better to catch the initial timeout and close the connection.

It seems like rescue_from Timeout::Error in ApplicationController should work, but for some reason the exception passed in is a Class and not Timeout::Error – most likely due to Rack::Timeout wrapping the entire app.

I [googled around](http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=rescue_from+timeout+error) and couldn't find a more elegant solution, but the below snippet in ApplicationController does the trick.

```ruby
# note: can not rescue from Timeout::Error directly because a timeout from Rack::Timeout ends up passing in Class as the exception
rescue_from Exception do |exception|
  # catch Timeout::Error or message from Rack::Timeout
  if exception.is_a?(Timeout::Error) || /execution expired/ =~ exception.message
    # prevent subsequent requests from reusing this mongo connection
    Mongoid.database.connection.close
  end
  raise
end
```

As a side note, Heroku's new cedar stack does not have the 30 second limit if you're streaming data – Rails 3.1 supports streaming.
