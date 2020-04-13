---
title: SARS-CoV-2 Analysis for Miami Beach
keywords: sample homepage
sidebar: home_sidebar
permalink: index.html
toc: false
---

BeachCov2 is an exercise in citizen community data journalism.

## Mission

To visualize the data that's relevant to our daily lives in Miami Beach, as we try to make sense of the COVID-19 pandemic.

## Background

I wanted to know if it was safe to go to the grocery store, but I couldn't find an estimate of the odds of any given person around me having been infected.  So I had to find my own way to estimate those odds.  I was surprised to conclude that a room full of fifty random people in Miami Beach almost certainly contained at least one person who had been infected.  And so I stopped going to the grocery store.

Once I had that estimate, I wanted to visualize the rate of change.  So I started an Excel spreadsheet for analysis, with charts.  I used the data released twice a data since March 23, 2020 from the Florida Department of Emergency Management.  I carefully designed charts showing the number of cases over time, the range in estimates for the number of infections over time, the number of cases as a percentage of the population, the number of infections as a percentage of the population, and the odds of any given person being infected.  I designed the charts to be easy to update, but they're intended to be updated by hand, with annotations for key insights.

Then I generalized the charts and added tracking for data for Miami and for the state of Florida.

## Sources

The infection estimates here are based on the confirmed case countes for the city of Miami Beach in the daily updates from the Florida Department of Health at https://www.floridadisaster.org/news-media/news/

The FDOH has been publishing these city-by-city counts since March 23, so that's the start date on the data in this analysis.

## Questions

* Based on the confirmed case count, what's a good estimate for how many infections there have been?
* What percentage of the population does the case count represent?
* What percentage of the populaton has been infected?
* What are the odds of any given person having been infected?

## Mechanism

I'm tracking the data in an [Excel spreadsheet](https://github.com/endymion/SARS-CoV-2_Analysis/blob/master/SARS-CoV-2%20Infection%20Odds%20-%20Miami%20Beach.xlsx) and using that to generate chart images.

## Infection count estimates

Mathematical modelers in the Centre for the Mathematical Modelling of Infectious Diseases at the London School of Hygiene & Tropical Medicine [found](https://cmmid.github.io/topics/covid19/severity/global_cfr_estimates.html) the U.S.’s case count likely represented just 14% to 19% of actual infections, so I'm multiplying the number of cases by five to seven to estimate the number of infections.

## Daily updates

I will update this data each day after the new data from the Florida Department of Health is published at around noon and 6 PM each day.
