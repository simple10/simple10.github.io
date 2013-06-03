---
author: joe
comments: true
date: 2010-09-23 20:33:17
layout: post
slug: fixing-online-groups
title: Fixing Online Groups
wordpress_id: 162
categories:
- social web
tags:
- federated social web
- groups
- social web
- xdi
---

[![](http://simple10.com/wp-content/uploads/2010/09/hierarchical_groups_preview-300x225.png)](http://simple10.com/wp-content/uploads/2010/09/hierarchical_groups_preview.png)It's almost 2011 and online groups are still broken.  Sure, you can join a Facebook group to support your cause, create a Google or Yahoo group for your soccer club, setup a Ning or Drupal site for your small business, but good luck getting that group to talk to others across the web.

Online groups are still treated as silos of individuals rather than first class citizens that can participate in other groups.  Silos are fine (and often desired) for small groups, but they just don't scale to hundreds of thousands or millions of users.  Not to mention that most physical groups are composed of subgroups (ad hoc gatherings, committees, local chapters, etc.) that self organize in ways that are not reflected in most online tools.

The future of online groups is context, not membership.

[Twitter](http://twitter.com/simple10/) and [PubSubHubBub](http://code.google.com/p/pubsubhubbub/) are headed in the right direction by contextualizing communication through topics rather than membership.  Tweeters (or is it twitterers?) use hash tags (#topic) to essentially join ad hoc topical conversations.  They can also create and join lists which function like traditional groups.  However, lists can not be nested which means there's no way to model hierarchical groups.

[PubSubHubBub](http://code.google.com/p/pubsubhubbub/) is a technology and code project rather than a service like Twitter.  With PubSubHubBub, people (or servers) subscribe to topics on a hub.  Each hub can implement logic for publishing and aggregating posts per topic.  Hierarchical groups can be modeled by having a separate hub per subgroup where each hub is subscribed to the hub above it in the hierarchy.

For instance...

<!-- more -->

Individuals subscribe to local hubs.  Local hubs subscribe to regional hubs, and regional hubs subscribe to the main global hub.  This effectively models a local chapter based global organization like a [350.org](http://350.org).  Only authorized users can publish to the global hub.  Regional and local hubs will automatically forward posts from the global hub.  Any individual can participate in a local hub.  Local posts are always rebroadcast to local subscribers.  Topics or posts that get a lot of local attention would then be sent to regional hubs and on up to the global hub if warranted.

This hierarchical approach to groups was partially spec'ed out in my [Open Action Network](http://www.openactionnetwork.org/) project that's temporarily on the back burner since I'm busy with a new startup.  The project conceptually uses [PubSubHubBub](http://code.google.com/p/pubsubhubbub/) and the [Salmon Protocol](http://www.salmon-protocol.org/) to move messages around in hierarchical groups.

There's also a lot of promise for managing groups in the [federated personal data store](http://personaldatastore.info/) model.  It works similarly to PubSubHubBub (and would be interoperable with hubs) but efficiently handles delegating of group permissions through XDI graphs and link contracts.  This allows for advanced permissions schemes where subgroups and individuals are granted granular access to other groups.  Messages and other group data are stored in graphs which have interesting semantic and social capabilities.  XDI messages can be tagged to prevent rebroadcast.  So a message posted in a local group node can stay local if that's what the user intends.

XDI for groups is still in early development, but it shows the significant promise i efficiently solving complicated group management and messaging use cases.  Join us on the [personal data store mailing list](http://groups.google.com/group/personaldatastore) if you're interested in participating in this discussion.
