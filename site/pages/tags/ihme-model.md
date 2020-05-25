---
title: IHME COVID-19 forecasting model
slug: ihme-model
author: Ryan Alyn Porter
category: covid19-model
tagName: ihme-model
search: include
permalink: ihme-model.html
sidebar: home_sidebar
folder: tags
toc: false
image_16_5:   images/posts/ihme-16_5.jpg
image_16_9: images/posts/ihme-16_9.jpg
image_1_1:  images/posts/ihme-1_1.jpg
excerpt: One of the most widely influential COVID-19 forecasting models
  has also been one of the most misinterpreted.
featured: true
---

Criticized at times both for being too optimistic{% cite politico:trump-overly-optimistic-model %} and too pessimistic{% cite science-matters:the-virus-wars %}, the COVID-19 forecasting model from the University of Washington’s Institute for Health Metrics and Evaluation has been one of the <mark>most widely discussed forecast models of the pandemic</mark>.  President Trump recently used the IHME model as the basis of his prediction that there would only be about 60,000 deaths in the US.{% cite politico:trump-overly-optimistic-model %}  The model's <mark>accessible <a href="https://covid19.healthdata.org/united-states-of-america">dashboard</a></mark> renders projections in charts that are <mark>easy to understand</mark>.{% cite ihme:covid19 %}

But the IHME model has also been <mark>widely misinterpreted</mark>, and has been used as the <mark>basis of a lot of misinformation</mark>.  For example, the IHME researchers are continually adjusting the parameters of the model to improve its accuracy.  Some people have interpreted the model's constant evolution as evidence that the forecasts are unreliable.{% cite statnews:model-uses-flawed-methods %}  Perhaps at the most extreme is the conspiracy theory that IHME forecasts that have been higher than reality reveal that the threat of COVID-19 has been overblown, in order to justify lockdowns that are cover for imposing a totalitarian surveillance state.{% cite infowars:virologists-question-lockdowns %}

Understanding any model's assumptions and methods is critical for interpreting what the model's results are saying, and what they're not saying.

## What does it say?

The goal of the IHME model is to provide <mark>a planning tool</mark> for health departments and other government officials.{% cite ihme:faq %}  The tool <mark>attempts to forecast the point when social distancing measures can be relaxed</mark>, by providing estimates of when infections could drop to 1 per 1 million people.

At that point, it may be possible to relax social distancing, <mark>if – and only if – widespread testing, contact tracing, isolation, and limitations on mass gathering are in place</mark>. The timeline could change based on what new data shows about the trajectory of the pandemic.

## What does it _NOT_ say?

The biggest and most dangerous misinterpretation of the IHME model's forecasts is the widespread belief that the model is projecting that death rates will peak and then subside and then the virus will go away.  That isn't what the model is forecasting at all. The researchers are explicit that they are only analyzing the "first wave" of the pandemic.{% cite ihme:forecasting-the-impact-of-the-first-wave %}

<blockquote class="blockquote">
It is critical to note that <mark>we restrict our projections to the first wave</mark> of the pandemic under a scenario of continued implementation of social distancing mandates and <mark>do not yet incorporate the possibility of a resurgence</mark> or subsequent waves.
<footer>{% reference ihme:forecasting-the-impact-of-the-first-wave %}</footer>
</blockquote>

## Strengths

The IHME results are so widely influential because they're so easily accessible.  The model's forecast [dashboard](https://covid19.healthdata.org/united-states-of-america) has a URL that anyone can view at any time.  The dashboard's charts are easy to understand: "Deaths per day", "Hospital resource use", "Total deaths."

{% include responsive-image-article-figure.html
  image='images/posts/ihme-chart-1_1.jpg'
  caption="A death rate forecast chart from the IHME model." %}

## Weaknesses

That accessibility might also be one of the model's biggest weaknesses.

### Easily misinterpreted

The National Hurricane Center releases hurricane forecast images that show the current position of the hurricane, along with a projected path and a cone of uncertainty.  Some critics have claimed that the center line confuses the public because it unduly focuses people too much the false idea of a precise forecast, when in reality the forecast is a wide range.{% cite bams:cone-of-uncertainty %}

{% include responsive-image-article-figure.html
  image='images/posts/nhc-hurricane-cone.png'
  caption="A hurricane forecast image from the National Hurricane Center." %}

In 2004, the NHC projections for the path of Hurricane Charley showed a cone of uncertainty for where the storm would make landfall that <mark>showed the center line of the storm passing directly over Tampa Bay</mark>.  The forecast then changed, putting the center line over Charlotte County, a hundred miles south of Tampa.  That area, full of retirees, was devastated.  People hadn't evacuated because they <mark>thought that the NHC was telling them that the storm was going to hit Tampa Bay</mark>, a hundred miles north of them.  <mark>Misinterpretation of a forecast graphic cost lives.</mark>

Many people, including even President Trump, have misinterpreted the center line of the IHME projections.  Trump's famously-optimistic projection that only 60,000 people would die in the entire COVID-19 epidemic in the US was an obvious misinterpretation of both the center line of the IHME charts and the overall intent of the model: to project the impact of the _first wave_ of the epidemic.{% cite wapo:misunderstanding-the-math %}

### Purely statistical

The IHME model doesn't understand anything about the dynamics of how the virus spreads. It <mark>doesn't consider how easily it spreads or how long someone can be infected before they show symptoms</mark>.  And it certainly doesn't consider the Heisenberg Effect, in terms of the effect that its own projections might have on the public's behavior.  It is <mark>purely a statistical model</mark>{% cite UT:projections-for-first-wave %}

The model <mark>looks at other places that have already been hit by the pandemic</mark>, like China and Italy.  It assumes that the infection will always taper off the way that it has in those places, and it tries to estimate when that might happen.  The model's assumptions about the population maintaining measures to slow the spread of the virus are the main factors that affect the forecast.  The researchers at IHME are <mark>constantly adjusting the input parameters</mark> based on new data, including changes in public behavior.  Ironically, some of these changes in behavior are now influenced by the model itself, creating a sort of <mark>Heisenberg-Effect feedback loop</mark>.

{% include responsive-image-article-figure.html
  image='images/posts/falling-wedge.jpg'
  caption="A 'Falling Wedge' stock pattern." %}

The IHME model's forecast is based only on the shapes of curves on charts.  It's <mark>not a simulation model</mark> like the <a href="/imperial-college-model.html">Imperial College model</a>.  Some people forecast stock prices by fitting current stock prices to patterns like [Fibonacci numbers](https://www.investopedia.com/ask/answers/05/fibonacciretracement.asp){% cite investopedia:fibonacciretracement %}.
For example, the "Falling Wedge" pattern pictured is a downward trend that some stock analysts see as an indication that the price will rise in the future.{% cite wikipedia:wedge-pattern %}

The IHME model is similar to this kind of pattern-matching forecast.  It <mark>doesn't even try to understand</mark> the
incubation period of the disease or the percentage of asymptomatic people, or
anything else about the disease itself.  It only looks for <mark>patterns in the curves</mark>.  Other researchers have criticized the model's methods for departing from classic epidemiological modeling and for optimistically assuming that the shape of the curve will be curtailed by social distancing.{% cite UT:projections-for-first-wave %}

<div class="alert alert-info" role="alert">
  <h4 class="alert-heading">See also</h4>
  <p>The <a href="/ut-covid19-model.html">University of Texas COVID-19 model</a> builds on the IHME model by adding real-time daily social-distancing data.{% cite UT:projections-for-first-wave %}</p>
  <hr>
  <p class="mb-0">The UT model also differs from the IHME model by using only US data, instead of assuming that the epidemic in the US will follow the same patterns seen in other countries.  And it attempts to improve on the verifiably-wrong IHME model's uncertainty calculations.</p>
</div>

### Only works with solid death data

The IHME researchers say that the biggest limitation of the model is that the only thing that it knows about the likely trajectory of the epidemic is death rate patterns that we have already observed elsewhere.  The model assumes a pattern of deaths that depends on the sort of tapering-off that we have seen in other countries.{% cite ihme:forecasting-the-impact-of-the-first-wave %}  If we don't maintain measures to slow the spread of the virus then the model's assumptions will be invalid, and the model will have little precedent to look toward for understanding what will happen.

The model produces less reliable forecasts in areas where there are low death rates.  The researchers have set a minimum of 50 deaths for an area before it can be applied.

It's also difficult to apply the IHME model in countries with less reliable death data, or with "more complicated data landscapes."{% cite ihme:faq %}

## Misleading journalism

It's especially dangerous when journalists misunderstand the IHME results and report on them, because they inadvertently spread risky misinformation.  In one recent example, CNN reported that "Last week, the model projected 67,641 deaths from Covid-19."

This is an example of [false precision](https://en.wikipedia.org/wiki/False_precision), when numerical data is presented in a manner that implies better precision than is justified.{% cite wikipedia:false-precision %}  Stating the forecast in terms of a precise center line encourages readers to view the model as a crystal ball.  And when the real numbers don't track the forecast precisely then people will misinterpret or misrepresent the error as evidence that the entire model is invalid and that the experts, in general, are all wrong.{% cite infowars:virologists-question-lockdowns %}

We can't blame CNN too much in this case, because the false precision comes from the IHME dashboard.  The charts on the dashboard clearly show a forecast _range_, but they also give a handy total.  Currently "74,073 COVID-19 deaths projected by August 4, 2020", as of this writing.  The number of [significant figures](https://en.wikipedia.org/wiki/Significant_figures) in the dashboard totals are inappropriately overstating the precision of the forecast,{% cite wikipedia:significant_figures %} and are misleading to the public.

## Update includes mask-wearing as a factor

The researchers at IHME have recently added mask-wearing as a factor{% cite ihme:updates %}, based
on polling data from an app called Premise.  They feel that empirical data
has recently not tracked their projections because they assumed that increasing
mobility data would indicate more infections and deaths, and that the effect
was less pronounced than they were expecting.  So they hypothesize that
behavioral changes may be a contributing factor, and they're trying to account
for it.  Other prominent statistical models like the new Bayesian models
from PolicyLab and Imperial College that are [forecasting exponential new
outbreaks]({% post_url 2020-05-21-South-Florida-may-see-a-new-outbreak-soon %}) in some areas account for changes in mobility but they don't yet
account for that kind of behavioral change.

## Conclusion

The IHME model can be useful for planning how long an area will need to maintain social distancing but it's <mark>easily misinterpreted</mark>, and people changing their behavior based on <mark>misinterpretation of the projections <could cost lives</mark>.  It's critical for journalists who report on the model to understand its assumptions and methods.

The model <mark>isn't a crystal ball</mark> and it doesn't understand anything about the virus.  It simply projects what the death-rate curve might look like for any given area, based on what the curve has looked like in other areas with similar measures in place to slow the spread of the virus.

The forecasts are no longer valid if people's behavior changes during the time shown in the projections.  The input parameters will then need to be adjusted, and the forecasts will need to be revised.  The model is not projecting the overall course of the pandemic and it's not forecasting that the disease will peak once and then go away.

<h2>References</h2>

{% bibliography --cited %}

## Related

{% include taglogic.html %}
