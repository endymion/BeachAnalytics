---
title: SARS-CoV-2 Analysis for Miami Beach
keywords: sample homepage
sidebar: home_sidebar
permalink: index.html
toc: false
---

BeachCov2 is an exercise in [citizen](https://en.wikipedia.org/wiki/Citizen_journalism) [community](https://en.wikipedia.org/wiki/Community_journalism) [data journalism](https://en.wikipedia.org/wiki/Data_journalism).

## Mission

To visualize the data, the estimates and the projections that are relevant to our daily lives in Miami Beach, as we try to make sense of the COVID-19 pandemic.

## Values

### Continuous, iterative improvement

Forecast models and scientific knowledge are always advancing, and I'm always trying to represent the most-current ideas.  I will adjust adjustments in my charts as things change.  For example, I recently updated the estimate range for the number of SARS-CoV-2 infections given the number of confirmed COVID-19 cases, based on updated computer models.

### Feedback

Please contact me and let me know if you think that any of my methods could be improved, or if any chart is in error and should be deprecated.

### Transparency

My analysis spreadsheet and data are available [on GitHub](https://github.com/endymion/BeachCov2), along with the complete version history. As well as the code for this web site.

### Documentation

I am to provide explanations for all of my estimations and projections, and citations.  I'm compiling a citation database, for storing references to news and research about the pandemic.

### Visualization best practices

Every chart should include a title, units, clear axis labeling, and a time stamp.

### Mobile compatibility

All images should be legible on any device, including tiny phone screens.

## Background

I'm a Miami Beach resident, sitting in my condo during the lockdown and trying to make sense of all of it.  I also happen to be a data scientist.  I'm a technology executive at a hospitality company with my own pressing questions about what's going to happen.  One of my professional responsibilities is data analysis and data engineering.  I make visualizations when I ask questions about data, and I'm publishing them so that my friends and neighbors can see how the data affects them too.

### What are the odds?

 I wanted to know if it was safe to go to the grocery store, but I couldn't find an estimate of the odds of any given person around me having been infected.  So I had to find my own way to estimate those odds.  I was surprised to conclude that a room full of fifty random people in Miami Beach almost certainly contained at least one person who had been infected.  And so I stopped going to the grocery store.

### What does it look like over time?

Once I had that estimate, I wanted to visualize the rate of change.  So I started an Excel spreadsheet for analysis, with charts.  I used the data released twice a data since March 23, 2020 from the Florida Division of Emergency Management.  I carefully designed charts showing the number of cases over time, the range in estimates for the number of infections over time, the number of cases as a percentage of the population, the number of infections as a percentage of the population, and the odds of any given person being infected.  I designed the charts to be easy to update, but they're intended to be updated by hand, with annotations for key insights.

### What about Miami?  And the rest of Florida?

Then I generalized the charts and added tracking for data for Miami and for the state of Florida.  Now I'm tracking all of those areas, and I have recorded their estimated populations for each so that I can visualize numbers as a percentage of the population.

## Sources

The infection estimates here are based on the confirmed case counts for the city of Miami Beach in the daily updates from the Florida Division of Emergency Management at https://www.floridadisaster.org/news-media/news/

The FDOH has been publishing these city-by-city counts since March 23, so that's the start date on the data in this analysis.

## Questions

* Based on the confirmed case count, what's a good estimate for how many infections there have been?
* What percentage of the population does the case count represent?
* What percentage of the populaton has been infected?
* What are the odds of any given person having been infected?

## Mechanism

I'm tracking the data in an [Excel spreadsheet](https://github.com/endymion/SARS-CoV-2_Analysis/blob/master/SARS-CoV-2%20Infection%20Odds%20-%20Miami%20Beach.xlsx) and using that to generate chart images.

## Daily updates

I will update this data each day after the new data from the Florida Department of Health is published at around noon and 6 PM each day.
