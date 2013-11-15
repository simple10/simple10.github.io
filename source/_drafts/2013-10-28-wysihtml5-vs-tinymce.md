Editor showdown.

TinyMCE is great, but it tabbing in and out of it didn't work correctly and 
the default style inside of the editor iframe didn't match the site. However, the 
new default theme for TinyMCE v4.0 looks great and is visually compatible with 
Twitter Bootstrap.

Wysihtml5 is lightweight without all the extra bells-and-whistles but worked 
better out of the box. Tabbing forward and backward worked. And the editor automatically
inherits basic styling like font size from the containing div. Pretty cool. Wysihtml5's
code also feels more aesthetically pleasing if you have to hack on it.

In the end, I chose wysihtml5 partly because Basecamp and other respectable projects are using it.
This makes it more motivating to for me to fix bugs and contribute pull request. 

Bummers ...

wysihtml5 uses <br> for line breaks instead of <p>
This makes it hard to style user entered content.


Check out https://github.com/simple10/bootstrap-wysihtml5-sass
