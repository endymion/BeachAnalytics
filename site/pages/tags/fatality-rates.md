---
title: Fatality rates
author: Ryan Alyn Porter
tagName: fatality-rates
search: include
permalink: fatality-rates.html
sidebar: home_sidebar
folder: topics
toc: false
summary: Weighing the risk of dying if you're infected is important
  if you're considering returning to work.  Especially if your job
  involves touching people.  So then, what is that risk?
---

Fatality rates are at the heart of the debate about reopening the
economy.  Overestimating the threat of the COVID-19 could cause unnecessary job losses, but underestimating it means more lives lost.

## Case fatality rate

How many people with confirmed COVID-19 cases end up dying?

The "best guess" models that US federal health officials are using to project
the COVID-19 death toll currently estimate that 0.5% of infected people who
show symptoms would die.  This percentage is the case fatality rate, or CFR.
Four of seven outside experts interviewed by the Center for Public Integrity said
that the infection fatality rate estimates in the government models were
too low.{% cite npr:reopening-too-fast %}

Epidemiologists are looking at other countries where we have better data
on case fatality rates because of better testing, like Germany, South Korea,
Singapore, Taiwan, and also the Diamond Princess cruise ship.  That data
appears to trend toward a case fatality rate of about 2%.

<center>
{% twitter https://twitter.com/tomaspueyo/status/1250959157496184832 %}
</center>

One of the reasons to look at data from other countries instead of data
from the US right now is that estimates for the case fatality rate for an
outbreak will evolve over time.  You can't accurately measure this metric
when you're still in the middle of an outbreak.

## Infection fatality rate

That's just accounting for confirmed cases, but what's the true fatality rate?
We're actually interested in that number.  How many infected people
end up dying, not just the official cases?

There's a gap between official cases
and true cases.  The fatality rate among the true cases is the infection
fatality rate, or IFR.

The best data comes from the countries with the highest testing rates.
Those places will have the smallest gap between the case fatality rate and
the infection fatality rate.  Looking at data from those countries,
estimating asymptomatic infections at between 20% and 50% of total infections,
the infection fatality rate is between 1% and 1.6%
{% cite science:contact-tracing %}  One of the most optimistic estimates
that only looked at the Diamond Princess put the infection fatality rate at
0.66%, which is still higher than the US federal government's "best guess"
estimate of 0.5%.{% cite lancet:diamond-princess-severity-estimate %}

We do at least know a lower bound on the infection fatality rate, since more
than one in one thousand people in New York have already died from COVID-19.
That's not one in one thousand cases or one in one thousand infections, that's
one in one thousand _people_.  So we know that the infection fatality rate
can't be lower than 0.1%, and that would be assuming that 100% of people in
New York have already been infected.

<center>
<figure>
{% responsive_image path: images/posts/2020-04-22-datagraver-deaths-per-million.jpeg %}
</figure>
</center>

Overall, experts generally think that the infection fatality rate is more
likely to end up above 1% than below.
That makes [herd immunity](/herd-immunity.html) look much less
attractive as a control strategy.

## Fatality rates change

It's crucial to remember that there is no one true case fatality rate or
infection fatality rate.  These metrics change over time, and they change
in different contexts.  The fatality rates vary by age, by country, and
according to other factors like the availability of health care and whether
the health care systems are overwhelmed.  The true infection fatality rate will be
a lot higher in developing regions than in developed nations.  And one of the
key findings of the [Imperial College model](/imperial-college-model.html)
is that the infection fatality rate would be much higher without
intervention.{% cite imperial-college:global-impact %}

<center>
<figure>
<iframe src="https://ourworldindata.org/grapher/coronavirus-cfr" style="width: 100%; height: 600px; border: 0px none;"></iframe>
</figure>
</center>

## Fatality rates by age

An example of the fatality rate varying is the well-known finding that COVID-19
is much more deadly for older people.  We can talk about an overall case
fatality rate for all of the people represented in this chart for New York, but
the real fatality rates vary for different age brackets.

<center>
<figure>
{% responsive_image path: images/posts/statistic_id1109867_covid-19-death-rates-in-new-york-city-as-of-april-21-2020-by-age-group.png %}
</figure>
</center>

## The worldwide infection fatality rate

The fatality rate data coming from around the world right now is coming from
developed nations.  Many factors will probably lead to higher fatality rates
in lower-income countries, including the availability of health care.  The
number of hospital beds, ICU beds, and health care workers per capita will
have a significant influence on fatality rates.

If the overall average infection fatality rate in developed nations is in the
1% to 2% range, then the worldwide average death toll could be significantly
higher.

## Implications

Assuming 90% of the world's population infected during the entire
pandemic due to [overshoot](/herd-immunity.html#overshoot), a 1% infection
fatality rate would result in about 69 million deaths worldwide.

A 2% infection fatality rate would lead to around 138 million deaths.

A 3% rate would lead to 207 million deaths worldwide.  And the worldwide average
rate could be higher.

## Conclusions

These staggering projections for deaths illustrate that
[herd immunity](/herd-immunity.html) is not a viable strategy because it would
lead to an unprecedented humanitarian disaster.

From a local perspective, if you interact with a lot of people every day,
then you're
[likely to be exposed](products/estimated-one-in-x-sarscov2-infection-odds/) to
the virus.  If you assume that you will be infected, then epidemiologists
currently estimate that you might have about a 0.5% to 2% chance of dying.

## References

{% bibliography --cited %}
