---
author: joe
comments: true
date: 2012-03-16 03:00:42
layout: post
slug: rspec-capybara-devise-login-tests
title: RSpec + Capybara + Devise Login Tests
wordpress_id: 290
categories:
- ruby
- testing
---

For the new version of [Connect.Me](http://connect.me) (in development), the interface is mostly driven through AJAX interactions. In the past, I've used Cucumber + Capybara to test JavaScript, but I really don't like the Cucumber syntax and slow tests. I recently switched to RSpec request specs with Capybara. The only problem is testing testing JS on pages that require a login.

Since Capybara runs in a different thread from the tests, session data is not available. So the Devise sign_in method does nothing for Capybara.

There are basically two solutions to get Capybara to authenticate:



	
  1. Use Capybara to login through a Devise login form by posting the user's email and password

	
  2. Set session data in Capybara to simulate a login (basically do the same thing that Devise's sign_in does)


For speed of tests reasons, I'd prefer to just set session data. After Googling around, I found [this solution](http://stackoverflow.com/questions/9144865/rspec-capybara-request-specs-cant-get-devise-to-post-new-user-session) and modified it a bit.

[code language="ruby"]
# spec/support/request_helpers.rb
require 'spec_helper'
include Warden::Test::Helpers

module RequestHelpers
  def create_logged_in_user
    user = Factory(:user)
    login(user)
    user
  end

  def login(user)    
    login_as user, scope: :user
  end
end
[/code]

Now you just need to call create_logged_in_user and you're good to go.

[code language="ruby"]
describe "user settings" do
  let(:authed_user) { create_logged_in_user }

  it "should allow access" do
    visit user_settings_path(authed_user)
    # should be good!
  end
end
[/code]
