---
date: 2020-04-28
title: Don't focus on the center line
author: Ryan Alyn Porter
featured: true
published: true
excerpt_separator: <!--more-->
tags: [covid19-models, ihme-model]
banner_image:   images/posts/nhc-hurricane-cone-16_5.jpg
facebook_image: images/posts/nhc-hurricane-cone-1_1.jpg
twitter_image:  images/posts/nhc-hurricane-cone-1_1.jpg
---

Don't focus too much on the center line of the IHME forecast charts, any more than you would assume that a hurricane will follow the center line on the NHC hurricane forecast cone images.  

<!--more-->

Many people are misinterpreting the COVID-19 [forecast model](/ihme-model.html) from the University of Washington’s Institute for Health Metrics and Evaluation.  In Florida, we already have some experience with one of the ways that people are misinterpreting the forecasts from our experience interpreting hurricane forecasts.

## Not a crystal ball

The readout on the dashboard of the IHME model forecasts the deaths precisely:

<blockquote class="blockquote">
74,073 COVID-19 deaths
projected by August 4, 2020
<footer>{% reference ihme:covid19 %}</footer>
</blockquote>

All the way down to seventy-three?  Really?

No.  The actual forecast, as of this writing, is a wide range.  From about 57,000 deaths by August 4 to about 130,000 deaths, or anywhere in between.

{% responsive_image path: images/posts/ihme-forecast-range.jpg
  template: _includes/responsive-image-article-figure.html
  caption: "This forecast is a range from about 57k to about 130k." %}

## Don't watch the center line

The center line on the chart is a big part of the reason that people misinterpret the precision of the IHME forecasts.

During hurricane season, meteorologists at the National Hurricane Center are so concerned that people will pay too much attention to the center line of the hurricane track forecast cone images{% cite bams:cone-of-uncertainty %} that they have <mark>removed the center line</mark> from the default forecast images.

{% responsive_image path: images/posts/nhc-hurricane-cone.png
  template: _includes/responsive-image-article-figure.html
  caption: "A hurricane forecast image from the National Hurricane Center." %}

The easy-to-understand center line in the IHME charts comes with the exact same problem: People are treating the model like a crystal ball and focusing on the center line.  And then they're <mark>disillusioned and they reject the whole model</mark> then the real death count doesn't track the center line exactly, or when researchers update the parameters of the model and the forecast line changes.  This stems from a tragic misunderstanding of what the model is trying to forecast and now it works.

In the worst case, people will misinterpret the IHME model's reports as saying that the threat of COVID-19 is over, and that it's okay to stop the social distancing.

## Misleading journalism

It's especially dangerous when journalists misunderstand the IHME results and report on them, because they inadvertently spread risky misinformation.  In one recent example, CNN reported that "Last week, the model projected 67,641 deaths from Covid-19."

This is an example of [false precision](https://en.wikipedia.org/wiki/False_precision), when numerical data is presented in a manner that implies better precision than is justified.{% cite wikipedia:false-precision %}  Stating the forecast in terms of a precise center line encourages readers to view the model as a crystal ball.  And when the real numbers don't track the forecast precisely then people will misinterpret or misrepresent the error as evidence that the entire model is invalid and that the experts, in general, are all wrong.{% cite infowars:virologists-question-lockdowns %}

We can't blame CNN too much in this case, because the false precision comes from the IHME dashboard.  The charts on the dashboard clearly show a forecast _range_, but they also give a handy total.  Currently "74,073 COVID-19 deaths projected by August 4, 2020", as of this writing.  The number of [significant figures](https://en.wikipedia.org/wiki/Significant_figures) in the dashboard totals are inappropriately overstating the precision of the forecast,{% cite wikipedia:significant_figures %} and are misleading to the public.

## Another big misconception

Another popular misconception about the IHME forecasts is the idea that the model predicts a single wave, possibly in part because the model's charts all show a single wave peaking and then subsiding.  That isn't what the model is forecasting.  The model is <mark><a href="/2020/04/27/its-not-the-peak-its-this-peak.html">only forecasting</a> the impact of the first wave</mark>.  <mark>The phrase "by August 4" is important!</mark>

## Conclusions

The IHME's COVID-19 forecasting model dashboard overstates the precision of the model's projections.  This does a disservice to planners and to the public by encouraging them to look at the model as a crystal ball with a precise answer, when it really is forecasting a wide range of possible outcomes.

Don't focus too much on the center line of the IHME forecast charts, any more than you would assume that a hurricane will follow the center line on the NHC hurricane forecast cone images.

<h2>References</h2>

{% bibliography --cited %}
