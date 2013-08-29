---
author: joe
date: 2009-09-24 11:11:26
layout: post
comments_id: a-better-way-to-grep-code
title: A Better Way to Grep Code
categories:
- dev
tags:
- bash
---

When grep'ing through code on OSX or linux, .svn files are a pain because grep will find code in the source file and in the corresponding svn file. To fix this, use the below bash script to omit .svn directories from grep searches.

Code Grep (cg)

Create a cg script in `/usr/local/bin`

```bash
!/bin/sh

if [ $# = 1 ]; then
  grep -ir "$1" * | grep -v ".svn/"
elif [ $# = 2 ]; then
  grep -ir "$1" $2/* | grep -v ".svn/"
else
  echo "Doh! Too many parameters.ncg "search" [FLAGS]"
fi
```

Thanks to [Maresa Nirwan's article](http://www.microshell.com/sysadmin/unix/customizing-grep-tool-to-exclude-svn/).

Include a few extra vars in your ~/.profile

```bash
export SVN_EDITOR=/usr/bin/vim
export GREP_OPTIONS="-I --color=always"
export CLICOLOR=1
export LSCOLORS=cxfxcxdxbxegedabagacad
```

And reload the profile with the source command

```bash
source ~/.profile
```
