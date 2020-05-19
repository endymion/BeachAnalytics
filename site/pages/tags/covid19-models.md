---
title: COVID-19 Forecasting Models
tagName: covid19-models
slug: covid19-models
search: include
permalink: covid19-models.html
sidebar: home_sidebar
folder: Topics
toc: false
featured: true
image_copyright: https://pixabay.com/photos/source-code-software-computer-4280758/
image_16_5: images/posts/source-4280758-16x5.png
image_16_9: images/posts/source-4280758-16x9.png
image_1_1:  images/posts/source-4280758-1x1.png
excerpt: Learn about the assumptions, methods, strengths and weaknesses of the computer forecasting models that have been making headlines every day.
---

Interpretations from COVID-19 forecasting models make headlines nearly every day lately.  To interpret the results of a predictive analytics model you have to understand the assumptions behind the model and its methods.  I'm compiling a catalog of the more prominent models, along with ensemble visualizations that combine the forecasts of all of the models.

<div class="post-list">
  {% assign model_pages = site.pages | where_exp:"item", "item.category == 'model'" | reverse %}
  {% for page in model_pages limit:4 %}
    {% include post_panel.html post=page %}
  {% endfor %}
</div>

<!-- <h2>References</h2>

{% bibliography --query @*[tags ~= models] %} -->

## Related

{% include taglogic.html %}
