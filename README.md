# SARS-CoV-2 Analysis for Miami Beach

This is an analysis of the rate of infections of SARS-CoV-2 the virus that causes the COVID-19 disease, in Miami Beach.

Please see the web site at https://BeachCoV2.info for more information.

## Contents

This project contains:

### Analysis

The [Excel spreadsheet](https://github.com/endymion/BeachCov2/blob/master/SARS-CoV-2%20Analysis%20-%20Miami%20Beach.xlsm) was the start of my local COVID-19 analysis.  I used it to design the charts.  Pros: Excel can make some nice charts.  Cons: Updating all of the visualization products by hand twice a day sucks.

Because of that, I'm moving the analysis to Google Data Studio.  That work is in progress.  The Excel spreadsheet will soon be obsolete.

### Scraper

The [`data`](https://github.com/endymion/BeachCov2/tree/master/data) folder contains the code for the data engineering for getting the data into Google Sheets so that it's available to Google Data Studio.  And soon also transformation code for appending analysis data, like smoothed doubling times or an estimation of _R<sub>0</sub>_.

### Web site

The [`docs`](https://github.com/endymion/BeachCov2/tree/master/docs) folder contains the code for https://BeachCoV2.info. It's a Jekyll site, intended for hosting on GitHub Pages.
