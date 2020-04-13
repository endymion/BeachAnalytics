---
title:  "New web site"
published: true
summary: "New web site, built with GitHub Pages."
tags: [meta]
---

I started a web site for documenting each product and exposing the most current visualizations.

I need a place where I can explain the basis for any estimation or projection that I'm doing in the visualizations and provide citations.

And I also want a system that will automatically locate the most current image and feature it on a web page.  I'm generating so many images lately that I need some automation to make it easier to manage.  For example, now I have a site that can automatically locate and display the current dashboard image for Miami Beach:

{% assign chart_files = site.static_files | where: "chart", true | where: "category","dashboard" | where: "category","dashboard" | sort: 'name' | reverse %}
{% for chart in chart_files limit:1 %}
  <p>
  {% capture chart_path %}{{ chart.path }}{% endcapture %}
  {% include image.html file=chart_path max-width="100%" %}
  </p>
{% endfor %}

## Details

The site is based on [Tom Johnson](https://idratherbewriting.com)'s excellent [Documentation Theme for Jekyll](https://idratherbewriting.com/documentation-theme-jekyll/), and hosted on [GitHub Pages](https://pages.github.com).  The source for the web site is [hosted on GitHub](https://github.com/endymion/BeachCov2/tree/master/web).
