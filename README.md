# SARS-CoV-2 Analysis for Miami Beach

This is an analysis of the rate of infections of SARS-CoV-2 the virus that causes the COVID-19 disease, in Miami Beach.

## Source

The infection estimates here are based on the confirmed case countes for the city of Miami Beach in the daily updates from the Florida Department of Health at https://www.floridadisaster.org/news-media/news/

The FDOH has been publishing these city-by-city counts since March 23, so that's the start date on the data in this analysis.

## Goals

* Estimating the number of infections based on the confirmed case count.
* Estimating the percentage of the populatation infected.
* Estimating the odds of any given person being infected.

## Mechanism

I'm tracking the data in an [Excel spreadsheet](https://github.com/endymion/SARS-CoV-2_Analysis/blob/master/SARS-CoV-2%20Infection%20Odds%20-%20Miami%20Beach.xlsx) and using that to generate chart images.

## Infection count estimates

Mathematical modelers in the Centre for the Mathematical Modelling of Infectious Diseases at the London School of Hygiene & Tropical Medicine [found](https://cmmid.github.io/topics/covid19/severity/global_cfr_estimates.html) the U.S.’s case count likely represented just 14% to 19% of actual infections, so I'm multiplying the number of cases by five to seven to estimate the number of infections.

## Current charts

### Miami Beach - Number of COVID-19 Cases - April 6, 2020 evening

![Miami Beach - Number of COVID-19 Cases - April 6, 2020 evening](https://github.com/endymion/SARS-CoV-2_Analysis/blob/master/charts/RP%20SARS-CoV-2%20Analysis%20-%20Miami%20Beach%20-%20Number%20of%20Cases%20-%20April%206%202020%206%20PM.png?raw=true)

### Miami Beach - Estimated Number of SARS-CoV-2 Infections - April 6, 2020 evening

![Miami Beach - Estimated Number of SARS-CoV-2 Infections - April 6, 2020 evening](https://github.com/endymion/SARS-CoV-2_Analysis/blob/master/charts/RP%20SARS-CoV-2%20%20Analysis%20-%20Miami%20Beach%20-%20Number%20of%20Infections%20-%20April%206%202020%206%20PM.png?raw=true)

### Miami Beach - SARS-CoV-2 Infection Percentage - April 6, 2020 evening

![Miami Beach - SARS-CoV-2 Infection Percentage - April 6, 2020 evening](https://github.com/endymion/SARS-CoV-2_Analysis/blob/master/charts/RP%20SARS-CoV-2%20Analysis%20-%20Miami%20Beach%20-%20Infection%20Percentage%20-%20April%206%202020%206%20PM.png?raw=true)

### Miami Beach - SARS-CoV-2 Infection Odds - April 6, 2020 evening

![Miami Beach - SARS-CoV-2 Infection Odds - April 6, 2020 evening](https://github.com/endymion/SARS-CoV-2_Analysis/blob/master/charts/RP%20SARS-CoV-2%20Analysis%20-%20Miami%20Beach%20-%20Infection%20Odds%20-%20April%206%202020%206%20PM.png?raw=true)

## Next steps

### Daily updates

I will update this data each day after the new data from the Florida Department of Health is published at around 6 PM each day.

### Curve fitting

Any input on curve fitting for forecasting the future would be extremely welcome.  Git commits are even more welcome.

### Other locations

I might add other locations, starting with Las Vegas, if I can get enough assistance from other people.  Please send Git commits.
