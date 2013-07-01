---
layout: default
title: 10 Hacks
tagline: Guides and tools for startup hackers.
---
{% include JB/setup %}


<section class="page-header">
  <div class="container">
    <i class="brand">10 Hacks</i> is a curated list of how-tos and tools for startup hackers.
    <i class="softwrap"></i>
    Open sourced on github.
    Details about the project.
  </div>
</section>

<div class="container">
  <section class="posts">
    <ol class="block-list">
      {% for post in paginator.posts %}
      <li>
        <h2 class="post__title"><a href="{{ post.url }}">{{ post.title }}</a></h2>
        <span class="post__time">{{ post.date | date: "%d %B, %Y" }}</span>
        <span class="post__author">{{ post.author }}</span>
      </li>
      {% endfor %}
    </ol>
  </section>

  <ol class="nav  pagination">
    <li class="pagination__prev">
      {% if paginator.previous_page %}
      {% if paginator.previous_page == 1 %}
        <a href="/">Previous</a>
      {% else %}
        <a href="/page{{paginator.previous_page}}">Previous</a>
      {% endif %}
      {% else %}
        Previous
      {% endif %}
    </li>
    <li class="pagination__next">
      {% if paginator.next_page %}
        <a href="/page{{paginator.next_page}}">Next</a>
      {% else %}
        Next
      {% endif %}
    </li>
  </ol>
</div>
