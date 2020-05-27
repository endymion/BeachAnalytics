---
title: COVID-19 data sources
author: Ryan Alyn Porter
tagName: covid19-data-sources
slug: covid19-data-sources
permalink: covid19-data-sources.html
search: include
folder: Topics
toc: false
featured: true
featured: true
image_copyright: https://www.pxfuel.com/en/free-photo-oonqr
image_16_5: images/posts/data-sources-16x5.jpg
image_16_9: images/posts/data-sources-16x9.jpg
image_1_1:  images/posts/data-sources-1x1.jpg
excerpt: Sources of data for COVID-19 analytics.
---

The hardest part of data analysis is finding data to analyze.  Here's a collection of data sources that I have found to be useful.  Some of the sources are openly available for anyone to access and analyze, while others have proprietary licenses.

<div class="post-list">
  {% assign pages = site.pages | where_exp:"item", "item.category == 'covid19-data-sources'" | reverse %}
  {% for page in pages limit:4 %}
    {% include post_panel.html post=page %}
  {% endfor %}
</div>

<!-- <h2>References</h2>

{% bibliography --query @*[tags ~= models] %} -->

<!-- ## Related

{% include taglogic.html %} -->
