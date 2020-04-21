---
title: COVID-19 Forecasting Models
tagName: models
search: include
permalink: covid19-models.html
sidebar: home_sidebar
folder: topics
toc: false
---

This is the first in a series of features about the COVID-19 computer forecast
models.  These features will explore the background, strengths, weaknesses, and
impact of each model.

{% assign model_pages = site.pages | where_exp:"item", "item.category == 'model'" %}
{% for page in model_pages %}
<h2><a href="{{ page.url }}">{{ page.title }}</a></h2>
<p>
  {% if page.summary %}
    {{ page.summary | strip_html | strip_newlines | truncate: 160 }}
  {% else %}
    {{ page.content | truncatewords: 50 | strip_html }}
  {% endif %}
</p>
{% endfor %}

## References

{% bibliography --query @*[tags ~= models] %}

## More from BeachCov2

{% include taglogic.html %}
