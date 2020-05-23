---
title: South Florida may see a new outbreak soon
summary: A model aimed at local forecasts projects a rapid spread of coronavirus in Miami-Dade and Broward counties, based on mobility, population density, age, insurance status, smoking prevalence, and weather.
tags: [covid19-models, mobility, unacast]
author: Ryan Alyn Porter
draft: false
published: true
featured: true
image_1_1:  images/posts/south-florida-new-outbreak-soon-1x1.jpg
image_16_9: images/posts/south-florida-new-outbreak-soon-16x9.jpg
image_16_5: images/posts/south-florida-new-outbreak-soon-16x5.jpg
image_copyright: https://policylab.chop.edu/project/forecasting-impacts-weather-and-social-distancing-covid-19-transmission-across-us
---

Epidemiologists widely agree that reducing social distancing while we still have active community transmission will lead to an increase in cases, and possibly an uncontrollable outbreak.

<!--more-->

We already know that cellphone data shows that <mark>South Florida has <a href="{% post_url 2020-05-16-south-florida-gives-up-on-social-distancing %}">not been</a> engaging in social distancing</mark> as well as we were during the start of the first wave of our coronavirus epidemic.{% cite unacast:social-distancing-scoreboard-miami-dade safegraph:us-geographic-responsed-to-shelter-in-place-orders descartes-lab:changes-in-us-mobility %}  But what does that mean for us?

<div class="alert alert-info float-right see-also" role="alert">
  <h4 class="alert-heading">See also</h4>
  <p><a href="{% post_url 2020-05-16-south-florida-gives-up-on-social-distancing %}">South Florida gives up on social distancing</a></p>
</div>

Data analysis shows a clear pattern: <mark>States that have successfully limited the spread have practiced social distancing more aggressively</mark>, and even more so when their death rate started to rise.{% cite ut:mortality-modeling-faq %}  But there aren't a lot of epidemiologists tailoring advice to South Florida.

<h2>What do the forecast models say?</h2>

Most of the computer models <mark>can't tell us much about what might happen in South Florida</mark>, specifically.  Their designers didn't build them for that.

Many of the models can’t help us to forecast our future in South Florida because they have a <mark>coarse granularity</mark>, only issuing projections at the state level.  Our situation in South Florida is very different from a lot of the rest of the state of Florida, and we need forecasts that can see the difference between a dense, urban area like Miami or Miami Beach, versus rural communities like Dixie County or Highlands County.  Researchers have found that <mark>the risk of infection and death is different in crowded areas like South Florida</mark>, versus rural areas.  Large, densely-populated areas like New York and Chicago had nearly <mark>twice the rate of transmission</mark> in the first two weeks of their outbreaks than less densely-populated areas like Birmingham, Alabama, or the metro area of Portland, Oregon.{% cite nytimes:crowding-affects-the-spread %}

Some models, like the University of Texas and IHME models, do account for changes in social distancing, but they <mark>update their assumptions about social distancing levels infrequently</mark>, and they <mark>assume that levels will remain constant</mark> until the next update.{% cite ut:mortality-modeling-faq %},{% cite ihme:forecasting-the-impact-of-the-first-wave %}  Researchers at the University of Texas provide this caveat{% cite ut:mortality-modeling-faq %} for their forecasts:

<blockquote class="blockquote">
Our model explicitly assumes that social distancing behavior remains at the levels we've observed over the last seven days of data. If that doesn't happen, you can <mark>throw our model's projections out the window beyond about ten days in the future</mark>.
</blockquote>

Researchers behind most of the models only designed their forecasts to project <mark>one wave of our epidemic</mark>.  They generally assume that social distancing will remain constant, or they only update their estimates of social distancing levels periodically. Accuracy analysis seems to show that these models <mark>can be effective at forecasting a single peak</mark> in the death rate that has been mitigated by social distancing. But they can't account for multiple peaks in the death rate caused by separate waves of COVID-19 transmission.

<h2>Forecasting COVID-19 in South Florida</h2>

Experts in public health at PolicyLab at the Children’s Hospital of Philadelphia Research Institute have provided a <mark>different kind of model</mark>.  Theirs is the only publicly-available model that <mark>projects the risk of a new outbreak in small geographic areas</mark> through the summer as we begin to reopen now, while accounting for other changing factors such as weather.{% cite policylab:new-model policylab:studying-effect-of-weather policylab:forecasting-impacts-of-weather %}

<blockquote class="blockquote">
 As our leaders plan for when and how to reopen communities, understanding the highly contagious nature of this virus and the factors that impact its spread must inform those decisions.  Complementary to other national models, our data differ in that they illustrate the situation in our own backyards. With our model, we hope to help city leaders and public health officials build more targeted strategies for reopening communities that consider not only the strain on our health care systems, but also how to deploy other strategies such as masking and workplace safety regulations to maintain some distancing as people leave the confines of their homes.
 <footer class="blockquote-footer">Dr. David Rubin, director of PolicyLab and a professor of Pediatrics at the University of Pennsylvania’s Perelman School of Medicine{% cite policylab:new-model %}</footer>
</blockquote>

<div class="alert alert-info float-right see-also" role="alert">
  <p class="mb-0"><i class="fa fa-info-circle" aria-hidden="true"></i> PolicyLab researchers found that warming spring temperatures are helping to reduce the spread of SARS-CoV-2 infections in some areas, but that effect is dwarfed by the impact of population density.</p>
</div>

The PolicyLab model, known as COVID-Lab: Mapping COVID-19 in Your Community looks at how population factors like <mark>age, insurance status, and smoking prevalence</mark> have affected the number and spread of coronavirus cases across a county.  Their model also looks at city characteristics like density.  It uses the <mark>same cellphone mobility data from <a href="https://www.unacast.com">Unacast</a> that showed us recently that South Florida has started to give up on social distancing</mark>,{% cite unacast:methodology %} and it has identified <mark>social distancing as the most important factor</mark> in reducing transmission.

<blockquote class="blockquote">
Measured against a number of local factors, we saw that strict social distancing policies and low population density, and, to a lesser extent, warming weather were all important in slowing the spread of this dangerous virus.  We were especially interested to find that rising temperatures may have helped reduce the spread of COVID-19, particularly in our less populous counties, but unfortunately the effect of weather, in the absence of strict social distancing policies, has not been strong enough to prevent resurgent transmission in our most crowded cities and their metropolitan areas.
  <footer class="blockquote-footer">Dr. Gregory Tasian, faculty member at PolicyLab, assistant professor of Urology and Epidemiology and senior scholar in the Center for Clinical Epidemiology and Biostatistics at the University of Pennsylvania’s Perelman School of Medicine{% cite policylab:new-model %}</footer>
</blockquote>

<h2>Projections for Miami-Dade and Broward</h2>

Unfortunately, the projections from the PolicyLab model don't look good for us.

{% include responsive-image-article-figure.html
  image='images/posts/Miami-Dade--Projected-cases-for-four-weeks--PolicyLab.jpg'
  caption="Miami-Dade County - Projected cases for four weeks.<br/>[credit: <a href='https://policylab.chop.edu/covid-lab-mapping-covid-19-your-community'>PolicyLab</a>]" %}

{% include responsive-image-article-figure.html
  image='images/posts/Broward--Projected-cases-for-four-weeks--PolicyLab.jpg'
  caption="Broward County - Projected cases for four weeks.<br/>[credit: <a href='https://policylab.chop.edu/covid-lab-mapping-covid-19-your-community'>PolicyLab</a>]" %}

The model estimates that <mark>each person infected with SARS-CoV-2 in Miami-Dade County might already be infecting more than one person</mark>, on average.  The infection will <mark>begin to spread exponentially again</mark> if this metric goes above 1.0 for an extended period.

{% include responsive-image-article-figure.html
  image='images/posts/Miami-Dade--R-estimate--PolicyLab.jpg'
  caption="Miami-Dade County - Estimated R, a metric representing the rate of spread.<br/>[credit: <a href='https://policylab.chop.edu/covid-lab-mapping-covid-19-your-community'>PolicyLab</a>]" %}

{% include responsive-image-article-figure.html
  image='images/posts/Broward--R-estimate--PolicyLab.jpg'
  caption="Miami-Dade County - Estimated R, a metric representing the rate of spread.<br/>[credit: <a href='https://policylab.chop.edu/covid-lab-mapping-covid-19-your-community'>PolicyLab</a>]" %}

<h2>What does this mean for us here?</h2>

David Rubin and Paul A. Offit from PolicyLab advise that rural areas that are less densely populated or that are already benefiting from warmer spring temperatures will probably be able to reopen more quickly, as long as the number of cases in their area has sharply reduced.{% cite nytimes:crowding-affects-the-spread %}

But they say that large, <mark>densely populated cities like Miami need a more cautious plan</mark>.  For two reasons: <mark>More crowded areas increase the risk of spread</mark>.  And also because we're learning that <mark>crowding itself may also affect the death rate</mark>. You could get sicker and have a <mark>higher risk of dying if you're exposed to more of the virus</mark> because you're in a densely-populated area. That's also what seems to have happened during the 1918 Influenza pandemic.{% cite plosone:influenza-dose-may-explain-high-mortailty-in-subsequent-waves %}

One of the biggest factors in the PolicyLab projections is social distancing,
and their model assumes that social distancing levels will remain constant in
the future.{% cite poicylab:small-area-projections %}  So, if social distancing
levels continue to decrease as South Florida reopens then updates of the model
could look even worse for us here.

In South Florida, we should remember as we make decisions about reopening that nation-wide and state-wide trends and forecasts don't necessarily apply directly to us.  Because they include a lot of areas where we know that the rate of the spread and the death rate will probably be significantly lower than we will experience here. The only forecast model currently available that's aimed at helping us with those decisions for our local community is warning that we may soon see a new outbreak that may be impossible to control.

<h2>References</h2>

{% bibliography --cited %}
