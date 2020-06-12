---
title: Censored state data scientist launches Florida COVID-19 dashboard independently
<!-- summary: lorem ipsum -->
author: Ryan Alyn Porter
draft: false
published: true
featured: true
image_1_1:  images/posts/community-coronavirus-dashboard-1x1.jpg
image_16_9: images/posts/community-coronavirus-dashboard-16x9.jpg
image_16_5: images/posts/community-coronavirus-dashboard-16x5.jpg
image_copyright: https://floridacovidaction.com
---

Rebekah Jones managed the Florida COVID-19 dashboard until she tried to add a feature to show which counties comply with the reopening criteria.  Now you can see what got her fired.

<!--more-->

Jones was the <mark>original architect of the dashboard</mark> that was hailed by Dr. Birx from the White House Coronavirus Task Force as one of the best in the country.{% cite floridapolitics:birx-dashboard %}  She made a different kind of news in May when the Florida Department of Health <mark>removed her from her post</mark>{% cite floridatoday:rebekah-jones-sidelined %} after reprimanding her for making unauthorized public statements.{% cite cbslocalmiami:jones-fired-for-public-statements %}

Her supervisor has reported that the incident that led to her removal was specifically about the “EventDate” data, the self-reported date that a patient remembers first developing symptoms.  This kind of information can be useful for the kind of timing analysis that researchers like Steve McConnell are using to provide [open-readiness reports](https://stevemcconnell.com/covid/covid-19-information-center-state-data/) at the state level.

Jones released a [public statement](https://geojones.org/2020/05/22/public-statement/) saying that the issue was that she <mark>refused "to manually change data in a misleading way</mark> to drum up public support of resuming pre-pandemic level of activities without a <mark>science-based assessment of each county’s respective risk or readiness</mark> to do so."{% cite rebehakjones:response-to-media %}

<blockquote class="blockquote">
If refusing to mislead the public during a health crisis is insubordination then I will wear that badge with honor.
<footer class="blockquote-footer">Rebekah Jones{% cite jones:dashboard %}</footer>
</blockquote>

## Is Florida ready to reopen?

The COVID-19 Task Force at the State of Florida announced in their [Plan for Florida's Recovery](https://www.flgov.com/wp-content/uploads/covid19/Taskforce%20Report.pdf) that <mark>Florida would follow the <i>White House Guidelines for Opening up America Again</i></mark> as a baseline for reopening.  That plan requires <mark>satisfying three benchmarks</mark> before reopening:{% cite florida:plan-for-floridas-recovery %}

* A downward trajectory of influenza-like illnesses (ILI) <i>and</i> a downward trajectory of COVID-19-like illnesses (fever, cough, shortness of breath)
* A downward trajectory of documented COVID-19 cases
<i>or</i> a downward trajectory of positive tests as a percent of total tests (at or increasing volume of tests)
* The capability to treat all patients without triggering surge capacity <i>and</i> robust testing program in place for at-risk healthcare workers, including emerging antibody testing

Florida is in the final stages of reopening, including in South Florida.  But do we meet those criteria?  Shouldn't we be able to monitor that?

## Now you can see that information

Jones has used her skills to launch an <mark>independent dashboard using the same public data</mark> that she used in the Florida Department of Health dashboard.  Her dashboard is called [Florida's Community Coronavirus Dashboard](https://experience.arcgis.com/experience/7572b118dc3c48d885d1c643c195314e/).

{% include responsive-image-article-figure.html
  image='images/posts/community-coronavirus-dashboard-dade-reopening-criteria.jpg'
  caption="Florida's Community Coronavirus Dashboard" %}

One of the key differences is that her dashboard includes the county-by-county "report cards" for monitoring whether each county satisfies the reopening criteria.  It shows that <mark>many counties do not meet the State of Florida's criteria for reopening</mark>.  For example, most of Florida is in Phase 2 of reopening, and Miami-Dade County is in Phase 1.{% cite nbcmiami:florida-governor-announces-phase-2 %}  Orange county went to Phase 2 on Friday, June 5, and theme parks have reopened.  But Jones' dashboard includes an assessment from June 5 showing that <mark>Orange County does not meet the criteria</mark>:

<blockquote class="blockquote">
<h2>Report Card for Orange County</h2>
<h3>Last report date: 6/5/2020</h3>

<p>
According to data published by the Florida Department of Health, Orange County does NOT meet the criteria for entering the next phase of reopening.
</p>

<p>
Have the following criteria decreased for a minimum of two reporting weeks?
</p>

<ul>
<li>ER Visits for Influenza-like Illness: <b style="color:red;">NO</b></li>
<li>ER Visits for COVID-like Illness: <b style="color:red;">NO</b></li>
<li>New cases by date: <b style="color:red;">NO</b></li>
</ul>

<i>
<p>
Information about Orange in the last one reporting week (5/30/2020-6/5/2020):
</p>

<p>
During the most recent reporting week in Orange County, ER visits for Influenza-like illness decreased by 4% and visits for COVID-like illness decreased by 35%. New cases increased by 46%.
</p>

<p>
Criteria data is measured and determined based on the trend over the last two reporting weeks, excluding the current week, summarized from Sunday-Saturday. The last report date was issued 6/5/2020. To review the state's reopening criteria, click here.
</p>

<p>
Whether or not a county meets the criteria is based on the previous two-week trend, so data from the last reporting week may show a decrease in cases or ER visits but the county still may not qualify for reopening if those figures increased during the previous reporting week. Both of the two previous weeks must show a consistent downward trend, and those that increase one week or decrease the next, or for counties where there was no change, would not meet the specified criteria outlined by state.
</p>
</i>
<footer class="blockquote-footer">Florida's Community Coronavirus Dashboard - Dade County Reopening Criteria{% cite rebekahjones:dashboard %}</footer>
</blockquote>

Miami-Dade County <mark>also does not meet the reopening criteria</mark>:

<blockquote class="blockquote">
<h2>Report Card for Dade County</h2>
<h3>Last report date: 6/5/2020</h3>

<p>
According to data published by the Florida Department of Health, Dade County does NOT meet the criteria for entering the next phase of reopening.
</p>

<p>
Have the following criteria decreased for a minimum of two reporting weeks?
</p>

<ul>
<li>ER Visits for Influenza-like Illness: <b style="color:red;">NO</b></li>
<li>ER Visits for COVID-like Illness: <b style="color:green;">YES</b></li>
<li>New cases by date: <b style="color:red;">NO</b></li>
</ul>

<p>
Information about Dade in the last one reporting week (5/30/2020-6/5/2020):
</p>

<p>
During the most recent reporting week in Dade County, ER visits for Influenza-like illness increased by 6% and visits for COVID-like illness decreased by 12%. New cases increased by 29%.
</p>

<p>
Criteria data is measured and determined based on the trend over the last two reporting weeks, excluding the current week, summarized from Sunday-Saturday. The last report date was issued 6/5/2020. To review the state's reopening criteria, click here.
</p>

<p>
Whether or not a county meets the criteria is based on the previous two-week trend, so data from the last reporting week may show a decrease in cases or ER visits but the county still may not qualify for reopening if those figures increased during the previous reporting week. Both of the two previous weeks must show a consistent downward trend, and those that increase one week or decrease the next, or for counties where there was no change, would not meet the specified criteria outlined by state.
</p>
<footer class="blockquote-footer">Florida's Community Coronavirus Dashboard - Dade County Reopening Criteria{% cite rebekahjones:dashboard %}</footer>
</blockquote>

## Other differences

The new, independent dashboard also counts coronavirus deaths differently from the official Florida dashboard.  The <mark>number of deaths is higher on the new dashboard</mark> because it includes deaths of non-residents who were infected in Florida.  Including deaths of visitors could help to address a serious issue in tourist areas like Miami Beach.

Consider an extreme example like the Las Vegas Strip: Very few people live on the Strip.  A significant number of <mark>people who will be infected in Las Vegas as it reopens will not show up in the coronavirus data</mark> for Clark County, Nevada.  Their positive tests, hospitalizations, and deaths will be recorded in other places like California and Arizona instead of in Nevada.  The absence of those cases <mark>could lead to statistics that give a false sense of security</mark> by under-reporting the impact of reopening.  Paying attention to deaths resulting from infections in Florida's tourist areas will be important for assessing the true situation places like Miami Beach and other popular destinations.

The <mark>number of cases is also higher on the new dashboard</mark> because it <mark>includes positive antibody tests</mark>, not just positive tests for the live virus.  At least one doctor has cautioned against including these extra tests because of the false-positive rates of many of the antibody tests.{% cite palmbeachpost:rebekah-jones-dashboard %}

The false-positive rates are a serious concern because <mark>the errors resulting from a test that is "95% accurate" can be surprisingly significant</mark>.

## Including antibody tests is a problem

A surprisingly low false-positive rate can have a <mark>significant impact on conclusions about overall infections</mark> because of the base rate fallacy.{% cite wikipedia:base-rate-fallacy %}  In an example from Wikipedia:

Imagine running an infectious disease test on a population A of 1000 people, in which <mark>40% are infected</mark>. The test has a false positive rate of 5%, and no false negatives. 400 people would receive a true positive, and 30 people would receive a false positive.  A person receiving a positive test could be <mark>over 93% confident that it correctly indicates infection</mark>.

Now consider the same test applied to population B, in which <mark>only 2% is infected</mark>. 20 people would receive a true positive. 49 people would receive a false positive.

In population B, only 20 of the 69 total people with a positive test result are actually infected. So, the <mark>probability of actually being infected after testing positive is only 29%</mark> for a test that otherwise appears to be "95% accurate".

The base rate for coronavirus infections is currently <mark>closer to the range in population B</mark> than it is in population A. Please <mark>remember this when interpreting coronavirus data that includes antibody tests in the number of cases</mark>.

## Thank you, Rebekah Jones

The push from the governor's office to reopen Florida counties that don't meet the state's reopening benchmarks is an <mark>obvious political problem for the governor's office</mark>.  It wouldn't be possible for the Florida Department of Health to provide a dashboard with the level of transparency that the White House Coronavirus Task Force praised if the dashboard were to show that Florida isn't ready to reopen.  Thanks to Rebekah Jones and her independent dashboard, we now have that level of transparency again.

<h2>References</h2>

{% bibliography --cited %}
