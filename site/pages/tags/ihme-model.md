---
title: IHME COVID-19 Forecasting Model
author: Ryan Alyn Porter
category: model
tagName: ihme-model
search: include
permalink: ihme-model.html
sidebar: home_sidebar
folder: tags
toc: false
banner_image:   images/posts/ihme-16_5.jpg
facebook_image: images/posts/ihme-1_1.jpg
twitter_image:  images/posts/ihme-1_1.jpg
summary: One of the most widely influential COVID-19 forecasting models
  has also been one of the most misinterpreted.
draft: true
featured: true
---

Criticized at times both for being too optimistic and too pessimistic, the COVID-19 forecasting model from the University of Washington’s Institute for Health Metrics and Evaluation has been one of the most widely discussed forecast models of the pandemic.  <mark>President Trump recently used the IHME model</mark> as the basis of his prediction that there would only be about 60,000 deaths in the US.{% cite politico:trump-overly-optimistic-model %}  The model's accessible [dashboard](https://covid19.healthdata.org/united-states-of-america) renders projections in charts that are easy to understand.{% cite ihme:covid19 %}

## What does it say?

The goal of the IHME model is to provide <mark>a planning tool</mark> for health departments and other government officials.{% cite ihme:faq %}  The tool <mark>attempts to forecast the point when social distancing measures can be relaxed</mark>, by providing estimates of when infections could drop to 1 per 1 million people.

At that point, it may be possible to relax social distancing, <mark>if – and only if – widespread testing, contact tracing, isolation, and limitations on mass gathering are in place</mark>. The timeline could change based on what data show about the trajectory of the pandemic.

## What does it _NOT_ say?

The biggest and most dangerous misinterpretation of the IHME model's forecasts is the widespread belief that the model is projecting that death rates will peak and then subside and then the virus will go away.  That isn't what the model is forecasting at all. The researchers are explicit that they are only analyzing the "first wave" of the pandemic.{% cite ihme:forecasting-the-impact-of-the-first-wave %}

<blockquote class="blockquote">
It is critical to note that <mark>we restrict our projections to the first wave</mark> of the pandemic under a scenario of continued implementation of social distancing mandates and <mark>do not yet incorporate the possibility of a resurgence</mark> or subsequent waves.
<footer>{% reference ihme:forecasting-the-impact-of-the-first-wave %}</footer>
</blockquote>

## Strengths

The IHME results are so widely influential because they're so easily accessible.  The model's forecast [dashboard](https://covid19.healthdata.org/united-states-of-america) has a URL that anyone can view at any time.  The dashboard's charts are easy to understand: "Deaths per day", "Hospital resource use", "Total deaths."

{% responsive_image path: images/posts/ihme-chart-1_1.jpg
  template: _includes/responsive-image-article-figure.html
  caption: "A death rate forecast chart from the IHME model." %}

## Weaknesses

That accessibility might also be one of the model's biggest weaknesses.

### Easily misinterpreted

The National Hurricane Center releases hurricane forecast images that show the current position of the hurricane, along with a projected path and a cone of uncertainty.  Some critics have claimed that the center line confuses the public because it unduly focuses people too much on the center forecast line.{% cite bams:cone-of-uncertainty %}

{% responsive_image path: images/posts/nhc-hurricane-cone.png
  template: _includes/responsive-image-article-figure.html
  caption: "A hurricane forecast image from the National Hurricane Center." %}

In 2004, the NHC projections for the path of Hurricane Charley showed a cone of uncertainty for where the storm would make landfall that <mark>showed the center line of the storm passing directly over Tampa Bay</mark>.  The forecast then changed, putting the center line over Charlotte County, a hundred miles south of Tampa.  That area, full of retirees, was devastated.  People hadn't evacuated because they <mark>thought that the NHC was telling them that the storm was going to hit Tampa Bay</mark>, a hundred miles north of them.  <mark>Misinterpretation of a forecast graphic cost lives.</mark>

Many people, including even President Trump, have misinterpreted the center line of the IHME projections.  Trump's famously-optimistic projection that only 60,000 people would die in the entire COVID-19 epidemic in the US was an obvious misinterpretation of both the center line of the IHME charts and the overall intent of the model: to project the impact of the _first wave_ of the epidemic.

### Purely statistical

The IHME model doesn't understand anything about the dynamics of how the virus spreads. It <mark>doesn't consider how easily it spreads or how long someone can be infected before they show symptoms</mark>.  And it certainly doesn't consider the Heisenberg Effect, in terms of the effect that its own projections might have on the public's behavior.  It is <mark>purely a statistical model</mark>

The model <mark>looks at other places that have already been hit by the pandemic</mark>, like China and Italy.  Then it attempts to fit data from US cities to those curves, assuming that the curves will have roughly the same shapes if the input parameters are the same.  The researchers at IHME are <mark>constantly adjusting the input parameters</mark> based on new data.

{% responsive_image path: images/posts/falling-wedge.jpg
  template: _includes/responsive-image-article-inset.html
  caption: "A 'Falling Wedge' stock pattern." %}

The resulting forecast is based on the shapes of curves on charts.  It's <mark>not a simulation model</mark> like the <a href="/imperial-college-model.html">Imperial College model</a>.  There are people who forecast stock prices by fitting current stock prices to patterns like [Fibonacci numbers](https://www.investopedia.com/ask/answers/05/fibonacciretracement.asp){% cite investopedia:fibonacciretracement %}.
For example, the "Falling Wedge" pattern pictured is a downward trend that's
seen as an indication that the price will rise in the future.{% cite wikipedia:wedge-pattern %}

The IHME model is similar to this.  It doesn't even try to understand the
incubation period of the disease or the percentage of asymptomatic people, or
anything else.  It only looks for <mark>patterns in the curves</mark>.

### Only works with solid death data

The IHME researchers say that the biggest limitation of the model is that the only thing that it knows about the likely trajectory of the epidemic is death rate patterns that we have already observed elsewhere.  The model assumes a certain consistency in the impacts of the virus if its input parameters are the same, and that assumption might not turn out to be valid if there are other factors that we haven't yet identified.{% cite ihme:forecasting-the-impact-of-the-first-wave %}

The model produces less reliable forecasts in areas where there are low death rates.  The researchers have set a minimum of 50 deaths for an area before it can be applied.

It's also difficult to apply the IHME model in countries with less reliable death data, or with "more complicated data landscapes."{% cite ihme:faq %}

## Conclusion

The IHME model can be useful for planning how long an area will need to maintain social distancing but it's <mark>easily misinterpreted</mark>, and people changing their behavior based on <mark>misinterpretation of the projections <could cost lives</mark>.

The model <mark>isn't a crystal ball</mark> and it doesn't understand anything about the virus.  It simply projects what the death-rate curve might look like for any given area, based on what the curve has looked like in other areas with similar measures in place to slow the spread of the virus.

The forecasts are no longer valid if people's behavior changes during the time shown in the projections.  The input parameters will then need to be adjusted, and the forecasts will need to be revised.  The model is not projecting the overall course of the pandemic and it's not forecasting that the disease will peak once and then go away.

<h2>References</h2>

{% bibliography --cited %}

## Related

{% include taglogic.html %}
