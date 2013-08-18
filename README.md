## What is Hackerpress?

Hackerpress is [Octopress](https://github.com/imathis/octopress) with a default theme based on [Twitter Bootstrap](http://twitter.github.io/bootstrap/) and some aesthetic tweaks to configuration and directory structure.

**Why Hackerpress vs Octopress or Jekyll?**

We created Hackerpress to use for our own static and blog sites hosted on [Github](https://github.com/10hacks). 
Initially, we started with Jekyll but wanted to use SASS and CoffeeScript. Using sass directly from the command line
worked fine for stylesheets but we needed the same compiling and syntax power for javascript.
The [jekyll-assets](https://github.com/ixti/jekyll-assets) plugin did the trick, but Github doesn't support
plugins. The only option is to precompile everything before deploying to Github. At this point, it made more 
sense to just switch to Octopress and tweak it for personal preference. The result was Hackerpress.

Hackerpress will likely end up as a Octopress theme rather than a fork. But for now, a fork is easier to hack.

## Components

Hackerpress default theme is built with:

* https://github.com/jlong/sass-twitter-bootstrap
* https://github.com/10hacks/flat-ui-sass

## Customizing Hackerpress Theme

See plugins/assets.rb for including compass or bourbon goodies.


## Documentation

Check out [Octopress.org](http://octopress.org/docs) for guides and documentation.


## Contributing

[![Build Status](https://travis-ci.org/10hacks/hackerpress.png?branch=master)](https://travis-ci.org/10hacks/hackerpress)

Plugins and other enhancements should be submitted to [Octopress](https://github.com/imathis/octopress).


## License
(The MIT License)

Copyright © 2013 Joe Johnston

Copyright © 2009-2013 Brandon Mathis

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
