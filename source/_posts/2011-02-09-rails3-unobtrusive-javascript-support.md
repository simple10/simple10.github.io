---
author: joe
date: 2011-02-09 19:57:18
layout: post
title: Rails 3's unobtrusive javascript support
categories:
- code
tags:
- jquery
- rails3
---

Rails 3's unobtrusive javascript support makes it easy to integrate [jQuery UI Autocomplete](http://jqueryui.com/demos/autocomplete/) and any backend or custom query you want. There's a [Rails3 jQuery Autocomplete](https://github.com/crowdint/rails3-jquery-autocomplete) gem already available on github, but it's not very RESTful and makes a lot of assumptions that might not fit your application.  So why not roll your own?

It's easy.

First, make sure your rails app is setup with jQuery support.

Next, download [jQuery UI Autocomplete](http://jqueryui.com/download), copy the appropriate files into your javascripts and stylesheets directories, and make sure the JS and CSS files are loading properly in your app.

Here's the general process I use to setup autocomplete for Rails 3:

## Controller
	
1. Create a method to handle the autocomplete search request

## Routes
	
1. Add a route for the method you created in the controller – this is your autocomplete search endpoint

## View

1. Add a text field with a unique class name like 'autocomplete'
2. Add a unique data attribute like 'data-endpoint' to the text field and set it to the path of your autocomplete endpoint

## Application.js
	
1. Enable jQuery Autocomplete on any DOM element with the class 'autocomplete' (or whatever you used in the view)
2. Use the value of data-endpoint as the source URL for the jQuery Autocomplete widget

In the following example, I'm tagging a user and using autocomplete to help suggest tags.

### controllers/users/tags_controller.rb

```ruby
class Users::TagsController < ApplicationController
  respond_to :json
  skip_before_filter :authenticate_user!, :only => [:index]

  def index
    @user = User.find(params[:user_id])
    @tags = Tag.where(["LOWER(name) LIKE ?", "#{params[:term].downcase}%"]).select('name').limit(15).map {|tag| tag.name}
    respond_with(@tags)
  end

  def create
    @user = User.find(params[:user_id])
    tag = @user.tags.create!(params[:tag])
    flash[:success] = 'Tag added'
    redirect_to user_path(@user)
  end
end
```

The tags controller has two methods. One for creating a tag, and one (index) for handling tag autocomplete searches.

The index method expects user_id and term params. In this example, the user_id is being handled in the path /users/:user_id/tags and jQuery Autocomplete sends in the term param.

### routes.rb

```ruby
resources :users do
  resources :tags, :only => [:index, :create], :controller => 'users/tags'
end
```

This creates a /users/:user_id/tags route and a users_tags_path helper to use in your views.

### views/users/show.html.haml

```ruby
= form_for [@user, @user.tags.build] do |f|
  .field
    = f.label :name, 'Tag'
    = f.text_field :name, :class => 'autocomplete', :'data-endpoint' => user_tags_path(@user)
  = f.submit 'Add Tag'
```


### javascripts/application.js

```javascript
jQuery(function($){
  $('.autocomplete').each(function(){
    var self = $(this);
    self.autocomplete({source: self.attr('data-endpoint')});
  });
});
```

That's all there is to it.  You can easily modify your controller and model code to use MongoDB, Solr, Redis, or whatever you want.

Happy coding.
