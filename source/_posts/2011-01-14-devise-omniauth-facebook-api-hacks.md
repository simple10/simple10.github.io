---
author: joe
date: 2011-01-14 03:12:16
layout: post
permalink: devise-omniauth-facebook-api-hacks
comments_id: devise_omniauth_facebook_api_hacks
title: Devise + OmniAuth + Facebook API Hacks
categories:
- code
tags:
- rails3
---

While using [Devise](https://github.com/plataformatec/devise) + [OmniAuth](https://github.com/intridea/omniauth) for a new Rails 3 project, I got really curious about how to reuse OmniAuth's strategy classes to fetch additional API data after a user has authenticated.

A lot of people probably use libraries like [FbGraph](https://github.com/nov/fb_graph) along with OmniAuth, but I wanted something extremely lightweight without duplicating code already in OmniAuth.

I mostly followed Ryan Bates' [railscasts](http://railscasts.com/episodes/235-omniauth-part-1) on setting up Devise + OmniAuth.

If you open the oa-oauth gem, you'll see a `lib/omniauth/strategies` folder filled with all sorts of OAuth2 providers like Facebook, Twitter, and LinkedIn. Each of these provider classes has most if not everything needed to make direct API calls once an OAuth2 access_token is obtained.

The basic idea is to store the access_token during an OAuth2 login process (Ryan covers this in his railscast) and later on use the token to fetch more data. To do this, you use the access_token to instantiate an OAuth2::AccessToken along with a Facebook specific `OAuth2::Client`. The Facebook client really just sets the site URL variable so the AccessToken knows where to send requests. It seems simple enough to just use OmniAuth's strategy classes for the `OAuth2::Client`. Then I don't have to maintain provider specific code myself.

I dug around in the Devise, OmniAuth, and OAuth2 code for hours.  Long story short, the simplest solution is to just write your own provider client class instead of trying to reuse OmniAuth's. Bummer. But way easier in the end. OmniAuth is a rack application designed for authentication only. It's just too convoluted to try to reuse its strategy classes for additional API calls.

Here's the simple solution I ended up writing...

Create lib/facebook.rb in your rails app

```ruby
module OAuth2
  module Clients
    class Facebook < Client
      def initialize(client_id, client_secret, opts = {})
        opts[:site] = 'https://graph.facebook.com/'
        super(client_id, client_secret, opts)
      end
    end
  end
end
```

Now you can use the Facebook client along with a user specific access_token (stored in a database during the OmniAuth login process) to fetch additional API data.

```ruby
require 'facebook'
client = OAuth2::Clients::Facebook.new('', '')
token = OAuth2::AccessToken.new(client, access_token)
token.get('/me/friends')
```

Note that you don't need to set the client_id, and client_secret when creating a new Facebook object. The id and secret are only needed to initially obtain the access_token which you already have.

On a side note, it's good to keep in mind that every additional OmniAuth provider creates a new rack application which gets called on every request. Hopefully this will not be the case in future versions so that an arbitrary number of providers can be supported without any performance concerns.

