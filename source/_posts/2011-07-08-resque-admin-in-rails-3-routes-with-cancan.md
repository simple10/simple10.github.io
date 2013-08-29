---
author: joe
date: 2011-07-08 19:01:49
layout: post
permalink: resque-admin-in-rails-3-routes-with-cancan
comments_id: resque_admin_in_rails_3_routes_with_cancan
title: Resque Admin in Rails 3 Routes with CanCan
categories:
- code
tags:
- rails3
---

[Resque](https://github.com/defunkt/resque) is a background jobs queue that's highly recommended over Delayed::Job if you are processing a lot of jobs. It uses [Redis](http://redis.io/) as the backend which doesn't suffer from db related bottlenecks under high load.

Resque comes with a built-in admin interface that's Rack compatible. In Rails 3, you can mount the Resque server admin directly in your routes.rb file.

```ruby
mount Resque::Server, at: '/resque'
```

But you'll definitely want to add password protection. Ryan Bates in his [Resque RailsCast](http://railscasts.com/episodes/271-resque) covers the basics of using Devise and HTTP auth. However, you'll probably want to hook into your existing ACL system. In my case, I'm using [CanCan](https://github.com/ryanb/cancan).

CanCan is not available in the routes.rb by default, but it's pretty easy to manually load the user and check permissions.

```ruby
# routes.rb
namespace :admin do
  constraints CanAccessResque do
    mount Resque::Server, at: 'resque'
  end
end
```

```ruby
# config/initializers/admin.rb
class CanAccessResque
  def self.matches?(request)
    current_user = request.env['warden'].user
    return false if current_user.blank?
    Ability.new(current_user).can? :manage, Resque
  end
end
```

```ruby
# ability.rb
class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.is_admin?
      can :manage, Resque
    end
  end
end
```

You'll need User.is_admin? method or change the logic in Ability to suit your project.

Now an authenticated user with is_admin? == true will be able to access Resque admin. Other users will get a 404 since no route matches.

Thanks to [Arcath's blog post](http://www.arcath.net/posts/38) for initially pointing me in the right direction.
