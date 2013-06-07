# Problem

Creating web apps in javascript that work offline and automatically sync to remove server.

# General Approach

Data API wrappers that store local modifications in localStorage or IndexedDB and support 
syncing / merging with a remote server.

# Solutions

## Frameworks

### Derby
* http://derbyjs.com/
* Supports syncing and realtime features
* Modular components can be used instead of the full framework
* Same code on server (Node.js) and browser client

## Libraries

### ShareJS
* http://sharejs.org/
* Used by Derby
* Uses [operational transformation](http://en.wikipedia.org/wiki/Operational_transformation)
  for syncing and merging

### Backbone.offline
*

### Backbone.dualStorage
* https://github.com/lucian1900/Backbone.dualStorage
* Replaces Backbone's Sync method
* Uses localStorage for caching of remote models
* Primitive full model syncing only

### PouchDB

### lawnchair
* http://brian.io/lawnchair/
* Micro framework for simple JSON storage
* Designed for mobile
* 

### persistence.js
* https://github.com/zefhemel/persistencejs
* Older library; not recommended
* Uses deprecated WebSQL and Google Gears


## Syncing Methods

### Good

[Evernote Data Access and Management (EDAM)](http://dev.evernote.com/media/pdf/edam-sync.pdf)

[Operational Transformation](http://en.wikipedia.org/wiki/Operational_transformation)


### Bad

Anything based on timestamp. There's no guarantee that an offline client's clock will be in 
sync with the server's clock. So relying on timestamps for syncing model data is a bad idea.


## Local Storage

### WebSQL
* SQLite in the browser
* Abandoned by W3C because Mozilla doesn't want to be [dependent on SQLite](https://hacks.mozilla.org/2010/06/beyond-html5-database-apis-and-the-road-to-indexeddb/)

### IndexedDB

### LocalStorage

### Memory or DOM

