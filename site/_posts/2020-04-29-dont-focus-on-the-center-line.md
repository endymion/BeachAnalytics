---
date: 2020-04-29
title: Don't focus on the center line
author: Ryan Alyn Porter
featured: true
published: true
excerpt_separator: <!--more-->
tags: [covid19-models, ihme-model]
image_16_5:   images/posts/NHC-Katrina-center-line-16_5.jpg
image_16_9: images/posts/NHC-Katrina-center-line-16_9.jpg
image_1_1:  images/posts/NHC-Katrina-center-line-1_1.jpg
---

Don't treat the center line of the IHME forecast charts as a precise prediction, any more than you would assume that a hurricane will follow the center line on the NHC hurricane forecast cone images.  The forecast is a wide range, not a specific number.

<!--more-->

Many people are misinterpreting the COVID-19 [forecast model](/ihme-model.html) from the University of Washington’s Institute for Health Metrics and Evaluation.  In Florida, we already have some experience with one of the ways that people are misinterpreting the forecasts from our <mark>experience interpreting hurricane forecasts</mark>.

## It's a range, not a precise prediction

On the morning of Friday, 13 August 2004 during Hurricane Charley, the National Hurricane Center's forecast for the path of the hurricane showed a <mark>cone of uncertainty</mark> for where the storm would make landfall that <mark>showed the center line of the storm passing directly over Tampa Bay</mark>.

{% include responsive-image-article-figure.html
  image='images/posts/NHC-Hurricane-Charley-2004-08-13-1100.gif'
  caption="The center line of the 11 AM forecast showed Hurricane Charley striking Tampa Bay." %}

Then the <mark>forecast changed</mark> that afternoon, shifting the center line to Charlotte County, <mark>a hundred miles south</mark> of Tampa.  That area, full of retirees, was devastated when the hurricane struck Punta Gorda in Charlotte County.  People hadn't evacuated because they <mark>thought that the NHC was telling them that the storm was going to hit Tampa Bay</mark>, a hundred miles north of them.<mark>  Misinterpretation of a forecast graphic cost lives.</mark>

{% include responsive-image-article-figure.html
  image='images/posts/NHC-Hurricane-Charley-2004-08-13-1500.gif'
  caption="The center line of the 2 PM forecast shifted a hundred miles southward." %}

Meteorologists at the National Hurricane Center are so concerned that people will pay too much attention to the center line of the hurricane track forecast cone images{% cite bams:cone-of-uncertainty %} that they have <mark>removed the center line</mark> from the default forecast images.  They do still publish a set of forecast images with center lines, but the default images no longer include the misleading center track.

{% include responsive-image-article-figure.html
  image='images/posts/nhc-hurricane-cone.png'
  caption="The default hurricane forecast images from the National Hurricane Center no longer include a misleading center-line forecast track." %}

## Same problem with COVID-19 projections

The easy-to-understand center line in the IHME charts comes with the <mark>exact same problem</mark>.  Many people, including even President Trump, have misinterpreted the center line of the IHME projections.  Trump's famously-optimistic projection that only 60,000 people would die in the entire COVID-19 epidemic in the US was an obvious misinterpretation of both the center line of the IHME charts and the overall intent of the model: to project the impact of the <a href="/2020/04/27/its-not-the-peak-its-this-peak.html"><i>first wave</i></a> of the epidemic.{% cite wapo:misunderstanding-the-math %}

{% include responsive-image-article-figure.html
  image='images/posts/ihme-forecast-range.jpg'
  caption="A confusing center line on a forecast that's really a range from about 57k to about 130k." %}

Unfortunately the center line on the charts leads people to treat the model like a crystal ball that will give them a specific answer.  And then when the real death count doesn't track the center line exactly, they're <mark>disillusioned and they reject the whole model</mark>.  Or when researchers update the parameters of the model and the forecast line changes.  This stems from a tragic misunderstanding of what the model is trying to forecast and now it works.

In the worst case, people will misinterpret the IHME model's reports as saying that the threat of COVID-19 is over and that it's okay to stop the social distancing.

## Not a crystal ball

The readout on the dashboard of the IHME model forecasts the deaths precisely:

<blockquote class="blockquote">
74,073 COVID-19 deaths
projected by August 4, 2020
<footer>{% reference ihme:covid19 %}</footer>
</blockquote>

All the way down to seventy-three?  Really?

No.  The actual forecast, as of this writing, is a <mark>wide range</mark>.  From about 57,000 deaths by August 4 to about 130,000 deaths, or anywhere in between.

## Misleading journalism

It's especially dangerous when journalists misunderstand the IHME results and report on them, because they <mark>inadvertently spread risky misinformation</mark>.  In one recent example, CNN reported that "Last week, the model projected 67,641 deaths from Covid-19."

This is an example of <mark><a href="https://en.wikipedia.org/wiki/False_precision">false precision</a></mark>, when numerical data is presented in a manner that implies better precision than is justified.{% cite wikipedia:false_precision %}  Stating the forecast in terms of <mark>a precise center line confuses readers</mark>.  Such an exact projection is obviously ridiculous, and people who spread misinformation have used that to <mark>ridicule the overly-precise IHME forecasts</mark> and advance a narrative that the experts have been completely wrong about the virus.{% cite infowars:virologists-question-lockdowns %}  When the real numbers don't track the forecast precisely, people then misinterpret or misrepresent the error as evidence that the entire model is invalid.

We can't blame CNN too much in this case, because the false precision comes directly from the IHME dashboard.  The charts on the dashboard clearly show a forecast _range_, but they also give a handy total.  Currently "74,073 COVID-19 deaths".  The number of [significant figures](https://en.wikipedia.org/wiki/Significant_figures) in the dashboard's own totals are <mark>inappropriately overstating the precision of the forecast</mark>,{% cite wikipedia:significant_figures %} and are <mark>misleading to the public</mark>.

<mark>Journalists should cite the full range of the forecast</mark> and the caveat that the model is only forecasting one wave.  For example: "The IHME model currently forecasts the total death rate in the US from the first wave of the COVID-19 outbreak will fall in the range from about 22 thousand people to about 122 thousand people."  <mark>Journalists should not overstate the precision of the forecast by reporting the center line</mark> of the projections or by using too many significant figures.  And the <mark>models themselves should avoid portraying false precision</mark> by stating broad ranges instead of the center-line forecast.

## Another big misconception

Another popular misconception about the IHME forecasts is the idea that the model predicts a single wave, possibly in part because the model's charts all show a single hump that peaks and then subsides.  That isn't what the model is forecasting, but you have to understand how the model works to understand that the charts showing the infection dropping to zero and then staying at zero are not really forecasting that the infection will do that.  The model is <mark><a href="/2020/04/27/its-not-the-peak-its-this-peak.html">only forecasting</a> the impact of the first wave</mark>.  <mark>The phrase "by August 4" is important!</mark>

## Conclusions

The IHME's COVID-19 forecasting model dashboard overstates the precision of the model's projections.  This does a <mark>disservice to planners and to the public</mark> by encouraging them to look at the model as a crystal ball with a precise answer, when it really is forecasting a <mark>wide range of possible outcomes</mark>.  The report designers on the modeling teams and journalists could both <mark>serve the public better</mark> by stating the forecast results more carefully as a range rather than as a specific number.

<mark>Don't focus too much on the center line</mark> of the IHME forecast charts, any more than you would assume that a hurricane will follow the center line on the NHC hurricane forecast cone images.

<h2>References</h2>

{% bibliography --cited %}
