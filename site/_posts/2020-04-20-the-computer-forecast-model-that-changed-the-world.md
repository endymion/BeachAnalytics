---
date: 2020-04-20
title: The computer forecast model that changed the world
author: Ryan Alyn Porter
published: true
excerpt_separator: <!--more-->
tags: [covid19-models, imperial-college-model]
banner_image:   images/posts/imperial-college-16_5.png
facebook_image: images/posts/imperial-college-1_1.png
twitter_image:  images/posts/imperial-college-1_1.png
---

No report from any forecast model has ever had such a significant impact on worldwide human society.

<!--more-->

The MRC Centre for Global Infectious Disease Analysis at Imperial College of London has arguably created one
of the most influential computer forecasting models in history.  Never before
has one report from one computer model had such a significant impact on human
society as this model did in March 2020.  Their work informs advisory groups
for the government, and during the week of March 9, 2020, preliminary results
from one of their reports alarmed officials and changed the world.

Researchers had been trying to warn governments that there would be trouble,{% cite lancet:warning-to-governments %} but
the Trump Administration was
reluctant to address the threat directly.  The British government took notice
when the Imperial College model <mark>projected that COVID-19 patients would overrun
their national health care system</mark>, and nearly immediately
began restrictions.  They notified their counterparts in the US government.

What happened next impacted every American.  By the end of the week of
March 9, the <mark>United States had declared a national emergency</mark>.  Many areas
like here in Miami Beach closed all restaurants and other non-essential businesses
and went into a shutdown.  The US stocks markets began <mark>one of the biggest
crashes in history</mark>{% cite wikipedia:2020_stock_market_crash %}, leading to a recession dubbed "<mark>The Great Lockdown</mark>."{% cite wikipedia:coronavirus_recession %}
It was the <mark>steepest economic downturn since the Great Depression</mark>.

All of this from one report from one forecasting model.

<h2>The team</h2>

{% responsive_image path: images/posts/neil-ferguson.png
  template: _includes/responsive-image-article-inset.html
  caption: "UK epidemiologist Neil Ferguson. Credit: Imperial College London" %}
The mathematical modeling team led by Professor Neil Ferguson and Dr Samir Bhatt
has been tracking COVID-19 since the start of the outbreak.  Their original
findings focused on China.  Ferguson, one of the founders of the MRC Centre for
Global Infectious Disease Analysis at Imperial College, was already one of the
leading names in the field of epidemiological modeling.  He had previously
worked on modeling BSE/vCJD, foot and mouth disease, SARS and MERS, pandemic influenza, Ebola and Zika.{% cite imperial-college:neil-ferguson %}

In mid-January, he <mark>took an existing model built in 2005 to study H5N1 avian
flu and adapted its assumptions to model SARS-CoV-2</mark>.  He and his team worked on
a report examining the projected impact of the epidemic in different countries
based on their economic level, and the potential life-saving effects of
social distancing.  He didn't get a day off from that point until mid-March.

<h2>The report</h2>

The news in their report was not necessarily that COVID-19 could kill a lot of
people.  The report doesn't even speculate about the final death count, it only
focuses on the near term.  What the Imperial College report added was the
<mark>analysis of the potential cost of not
taking measures to slow the spread of the infection</mark>.{% cite imperial-college:global-impact %}

{% responsive_image path: images/posts/imperial-college-mitigation-chart.png
  template: _includes/responsive-image-article-figure.html
  caption: "Chart from Imperial College report showing the potential
  life-saving effects of social distancing." %}

The report is especially relevant now in April, as society faces a crisis of
discipline in maintaining social distancing.  For example, the above chart
from their report <mark>predicts a second wave after suppression strategies are
lifted after three months</mark>.  Some quotes from the paper seem as prophetic now,
a month later, as one would hope from a report from a forecasting team:

<blockquote class="blockquote">
We do not consider the wider social and economic costs of suppression, which will be high and may be disproportionately so in lower income settings. Moreover, <mark>suppression strategies will need to be maintained in some manner until vaccines or effective treatments become available to avoid the risk of later epidemics</mark>. Our analysis highlights the challenging decisions faced by all governments in the coming weeks and months, but demonstrates the extent to which <mark>rapid, decisive and collective action now could save millions of lives</mark>.
<footer>{% reference imperial-college:global-impact %}</footer>
</blockquote>

<mark>The timing amplified the impact of the report</mark>.  As Ferguson was briefing
UK government officials, they were hearing from terrified colleagues in Italy
who were realizing how many COVID-19 patients were going to require invasive
ventilation in ICUs.  The report may have been the final straw that resulted
in a “<mark>sudden focusing of minds</mark>”, according to Ferguson.  The UK government
had suddenly become more receptive to imposing social distancing, and the US
wasn't far behind.

Just two days after briefing officials in Downing Street, Ferguson's own
symptoms started.{% cite nature:covid19-simulations %}  He had <mark>contracted the same COVID-19 disease</mark> that he had
spent months modeling.

<center>
{% twitter https://twitter.com/neil_ferguson/status/1240171876695117824 %}
</center>

<h2>Criticism</h2>

Ferguson is feeling better now, but he's facing increasing scrutiny for what
might be the biggest weakness of the Imperial College model: a lack of
transparency.  Ideally, a model should have documented, open source code
that's portable enough for other people to run it and reproduce your results.
At a bare minimum, researchers should document their assumptions, input
parameters, and methods.

Despite promising a month ago on March 22 that he was working with Micosoft and
GitHub to release the code for the model, <mark>Ferguson still has not posted anything on GitHub</mark>.

<center>
{% twitter https://twitter.com/JmsGrogan/status/1251763035267620865 %}
</center>

Ferguson said that the code is dirty and undocumented and needs refactoring work,
but nobody expects it to be perfect.  He should post the source code as-is,
and then push updates as he refactors the code to improve it.  Science shouldn't
have to wait for him to clean up his code before learning from it.

<h2>References</h2>

{% bibliography --cited %}
