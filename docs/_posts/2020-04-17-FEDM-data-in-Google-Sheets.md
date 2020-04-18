---
date: 2020-04-17 15:00
title:  "FDEM data now available in Google Sheets"
published: true
summary: "It's easy to analyze the FDEM COVID-19 data now that it's in spreadsheet form."
tags: [meta, data-engineering]
---

## Problem

The Florida Department of Emergency Management releases their twice-daily updates as PDF files.  The data in those files is not easy to analyze without extracting it into a spreadsheet or a data file.  I have been pulling numbers by hand out of the PDF files into an Excel spreadsheet for analysis.  It's time-consuming and it delays my updates, and if I take a day off then the visualizations don't update themselves.

## Solution

I wrote some [code](https://github.com/endymion/BeachCov2/tree/master/data) that extracts the city-by-city data from those PDF files into a spreadsheet in Google Sheets.  I can run it periodically to get the latest updates.  Then I can use that spreadsheet directly for visualizations with Google Data Studio, or I can transform the data to other spreadsheets with Ruby or R for further analysis and use those spreadsheets in visualizations.

I made [the spreadsheet](https://docs.google.com/spreadsheets/d/1us_aePT2_OQoc3iBXckrBAeYZb8j4bVAY_cr8t6V8r0/edit?usp=sharing) public, and I'll update it with each new FDEM update:

<iframe style="width:100%;" height="500px" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTs88ZRLrHIs9YQyzyhuONV7lQfpGB6Y0KhmkfkJNpnYkcGMW2jOSyjXSabu3iUYyVnI8-hWajTXES_/pubhtml?widget=true&amp;headers=false"></iframe>

All that I have so far is the city-by-city data, but that's a start.  Next I'll add the county-level data to another Google Sheets spreadsheet, and then also the Florida-wide data..

I'm currently not using the case-by-case data in the FDEM reports, and I don't have any plans to extract that data.  Please contact me if you need that data in machine-readable form and it might help you if I did extract it.  I'd be happy to do that.

I still have to run this each time, but I designed all of the code to run in AWS Lambda.
