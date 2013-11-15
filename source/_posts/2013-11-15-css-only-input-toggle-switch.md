---
author: joe
date: 2013-11-15 15:10:00
layout: post
title: CSS Only + Accessible Input Toggle Switch
categories:
- code
tags:
- css
- usability
- ui
---

CSS input toggle switches are nothing new, but I've yet to see one that is 
Bootstrap 3 compatible, doesn't use JavaScript, accepts tab focus and
styles properly, and doesn't break accessibility. So I wrote one.

[Demo on JSFiddle](http://jsfiddle.net/simple10/5x99N/2/) - but without JS ;-)

```css
/* Toggle instances */
 .toggle {
    width: 140px;
}

/* General toggle styles */
 .toggle {
    position: relative;
    padding: 0;
    display: inline-block;
    white-space: nowrap;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    -o-user-select: none;
    user-select: none;
}
.toggle input {
    position: absolute;
    opacity: 0;
}
.toggle > div {
    overflow: hidden;
    padding: 0;
    width: 100%;
}
.toggle label {
    display: block;
    margin: 0 0 0 -100%;
    padding: 0;
    width: 200%;
    -webkit-transition: margin 0.15s cubic-bezier(1, 0.035, 0.665, 0.91);
    transition: margin 0.15s cubic-bezier(1, 0.035, 0.665, 0.91);
}
.toggle label:before, .toggle label:after {
    content:" ";
    display: table;
}
.toggle label:after {
    clear: both;
}
.toggle label .btn {
    display: block;
    float: left;
}
.toggle input:focus + div {
    outline: thin dotted #333;
    outline: 5px auto -webkit-focus-ring-color;
    outline-offset: -2px;
}
.toggle input:checked + div > label {
    margin-left: 0;
}
.toggle input:checked + div > label .toggle-handle {
    left: 90%;
    left: calc(90% - 2px);
}
.toggle-on, .toggle-off {
    border-radius: 0;
    width: 50%;
}
.toggle-on {
    padding-right: 10%;
}
.toggle-off {
    padding-left: 10%;
}
.toggle-handle {
    width: 10%;
    padding: 0;
    position: absolute;
    left: 2px;
    top: 2px;
    bottom: 2px;
    -webkit-transition: left 0.15s cubic-bezier(1, 0.035, 0.665, 0.91);
    transition: left 0.15s cubic-bezier(1, 0.035, 0.665, 0.91);
}
.toggle-align .toggle-on {
    text-align: left;
    padding-right: 0;
}
.toggle-align .toggle-off {
    text-align: right;
    padding-left: 0;
}
```

```html
<div class="toggle">
    <input name="t1" type="hidden" value="0" />
    <input id="t1" name="t1" type="checkbox" value="1" />
    <div class="btn">
        <label for="t1">
            <div class="toggle-on btn btn-success"> <i class="glyphicon glyphicon-ok"></i>
Public</div>
            <div class="toggle-handle btn btn-default"></div>
            <div class="toggle-off btn btn-warning active">Private <i class="glyphicon glyphicon-lock"></i>

            </div>
        </label>
    </div>
</div>
```

If you have stacked toggles, just add toggle-align class to `<div class="toggle toggle-align">` 
to align text. This is optional, but looks better IMHO.

## Other toggle switches for reference:

* [http://www.bootstrap-switch.org/](http://www.bootstrap-switch.org/)
* [http://minhur.github.io/bootstrap-toggle/](http://minhur.github.io/bootstrap-toggle/)
* [http://ghinda.net/css-toggle-switch/](http://ghinda.net/css-toggle-switch/)
