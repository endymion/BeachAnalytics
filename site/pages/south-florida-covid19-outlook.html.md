---
title: South Florida COVID-19 Outlook
summary: South Florida COVID-19 Outlook
slug: south-florida-covid19-outlook
permalink: south-florida-covid19-outlook.html
author: Ryan Alyn Porter
featured: false
published: true
show_related: false
image_1_1:  images/posts/South-Florida-outlook-1x1.png
image_16_9: images/posts/South-Florida-outlook-16x9.png
image_16_5: images/posts/South-Florida-outlook-16x5.png
---
<!--more-->

<div class="chart panel">
  <div class="headline">
    <div class="meta">
    <h4>Miami Metropolitan Area</h4>
    Daily New Confirmed Cases
    </div>
  </div>
  <div class="banner">
    {% include current_chart.html
      chart_type="daily-new-confirmed-covid19-cases"
      area="/miami-metropolitan-area/" %}
    <p>The second wave of the outbreak is now clearly visible in the daily
      new confirmed case counts.</p>
    <p>The <a href="https://en.wikipedia.org/wiki/Miami_metropolitan_area"
      target="wikipedia">Miami metropolitan area</a> includes the urban areas
      in South Florida, and ranges from Homestead to West Palm Beach.</p>
  </div>
</div>

<div class="chart panel">
  <div class="headline">
    <div class="meta">
    <h4>Miami Metropolitan Area vs The Rest of Florida</h4>
    Daily New Confirmed Case Counts
    </div>
  </div>
  <div class="banner">
    {% include current_chart.html
      chart_type="daily-new-confirmed-covid19-cases"
      area="/miami-metropolitan-area-vs-rest-of-florida/" %}
    <p>The first wave hit the Miami metropolitan area hard, but now there
      are more cases in the rest of Florida.</p>
  </div>
</div>

<div class="chart panel">
  <div class="headline">
    <div class="meta">
    <h4>Miami & Miami Beach</h4>
    Daily New Confirmed Case Counts
    </div>
  </div>
  <div class="banner">
    {% include current_chart.html
      chart_type="daily-new-confirmed-covid19-cases"
      area="/miami-and-miami-beach/" %}
  </div>
</div>

<div class="chart panel">
  <div class="headline">
    <div class="meta">
    <h4>Florida, Outside of South Florida</h4>
    Daily New Confirmed Cases
    </div>
  </div>
  <div class="banner">
    {% include current_chart.html
      chart_type="daily-new-confirmed-covid19-cases"
      area="/rest-of-florida/" %}
    <p>This chart shows all new cases with a city identified, where the city is outside of the Miami metropolitan area.</p>
  </div>
</div>
