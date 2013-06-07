# Problem

Creating web apps in javascript that work offline and automatically sync to remove server.

# General Approach

Data API wrappers that store local modifications in localStorage or IndexedDB and support 
syncing / merging with a remote server.

# Solutions


Frameworks
==========

### Derby
* http://derbyjs.com/
* Supports syncing and realtime features
* Modular components can be used instead of the full framework
* Same code on server (Node.js) and browser client

### remoteStorage.js

### JayData
* http://jaydata.org/
* Supports OData, Facebook, and a bunch of backends

Libraries with Sync
===================

Local storage libraries that support syncing to a remote server.

### ShareJS
* http://sharejs.org/
* Used by Derby
* Uses [operational transformation](http://en.wikipedia.org/wiki/Operational_transformation)
  for syncing and merging

### Backbone.offline

### PouchDB

### ydn-db
* http://git.yathit.com/ydn-db/wiki/Home
* Supports syncing to Google Drive
* Supports full-text search
* Supports different [merge algorithms](http://git.yathit.com/ydn-db/src/92a33f189b70/js/ydn/db/algo?at=master)

### persistence.js
* https://github.com/zefhemel/persistencejs
* Older library; not recommended
* Uses deprecated WebSQL and Google Gears


Libraries without Sync
======================

Local storage libraries that can be extended to sync to a remote server.

### Backbone.dualStorage
* https://github.com/lucian1900/Backbone.dualStorage
* Replaces Backbone's Sync method
* Uses localStorage for caching of remote models
* Primitive full model syncing only

### lawnchair
* http://brian.io/lawnchair/
* Micro framework for simple JSON storage
* Designed for mobile
* 

### PersistJS
* https://github.com/jeremydurham/persist-js
* does not sync?

### Aplify.store
* http://amplifyjs.com/api/store/
* does not sync?

### Store.js
* https://github.com/marcuswestin/store.js/
* localStorage wrapper for legacy browser support





Syncing Methods
===============

### Good

[Evernote Data Access and Management (EDAM)](http://dev.evernote.com/media/pdf/edam-sync.pdf)

[Operational Transformation](http://en.wikipedia.org/wiki/Operational_transformation)

[Merge Algorithms](http://en.wikipedia.org/wiki/Merge_(revision_control))


### Bad

Anything based on timestamp. There's no guarantee that an offline client's clock will be in 
sync with the server's clock. So relying on timestamps for syncing model data is a bad idea.


Local Storage
=============

### WebSQL
* SQLite in the browser
* Abandoned by W3C because Mozilla doesn't want to be [dependent on SQLite](https://hacks.mozilla.org/2010/06/beyond-html5-database-apis-and-the-road-to-indexeddb/)
* Transaction support

### IndexedDB
* Size limit before asking user permission:
** 50MB in Firefox
** 250MB in IE10
** [1/2 of available space](https://developers.google.com/chrome/whitepapers/storage#temporary) in Chrome
* Storage is often shared with AppCache per domain
* Transaction support

### localStorage
* Size limit before asking user permission:
** 5MB of storage in most browsers
* No transactions

### sessionStorage
* No transactions

### Memory or DOM
* No transactions



Articles
========

Syncing Offline Data for Webapps – by Addy Osmani at Google<br>
https://plus.google.com/+AddyOsmani/posts/9457wajmWvB



