---
layout: landing_page
title: Advance+
page_class: page
template_engine: serbea
published: false
---

{% session_button = capture do %}
  <p><sl-button variant="primary" size="large" pill onclick="document.querySelector('sl-dialog#book-session').show()">
    Book Your Session Now
  </sl-button></p>
{% end.strip.then(&method(:redent)) %}

{% content_for :top_lead do %}
  {:.lead}
  That's pretty rad, captain.
  {:style="text-align:center"}

  {{ session_button }}
  {:style="margin-block-start:var(--sl-spacing-3x-large);text-align:center"}
{% end %}

{%= liquid_render "section" do %}

  ## Dev for a Day.

  Expertise at your fingertips.

{% end %}

{%= liquid_render "section", alt_invert: true do %}

  ## Jared Who?

  **Hi, I'm Jared.** I live and work in Portland, Oregon. I'm a web developer.

  {: .professional-photograph}
  ![A photo of Jared sitting with his hands folded neatly on the table in front of him](/images/jared-studio-professional.jpg){:width="440"}{:loading="lazy"}{:title="Jared in Hat"}

  I've been at this a long time. A long, long time. I first got my start building websites in the 90s. I've seen entire subindustries of the web come and go. One day it's J2EE, another day it's Gatsby. There's always somebody promoting flashy yet overengineered technology that's so complicated it requires a slew of consultants ready to "fix" all the problems that inevitably arise.

  **I'm sick of it.** Some days I've dreamed of retiring early if no sane alternative emerged!

  Thankfully, [I'm not the only one decrying the complexity of the modern web](https://web.archive.org/web/20201216033103/https://macwright.com/2020/05/10/spa-fatigue.html){:target="_blank"}. Cooler heads are prevailing, praise be to Berners-Lee.

  I'm a champion of the underdog: the solo dev, the small tight-knit team. I'm with the people who believe you can build great things with simple, easy-to-understand tools and a commitment to the greatest invention in the history of mankind: **the open web**. _Join the resistance_ and together we shall accomplish great things. I can't wait.

  Follow me on <a href="https://twitter.com/jaredcwhite" target="_blank" style="margin-right:var(--sl-spacing-3x-small)"><sl-icon name="twitter"></sl-icon>Twitter</a> ✦ <a href="https://jaredwhite.com" target="_blank"><sl-icon name="globe"></sl-icon>Website</a>

{% end %}

{%= liquid_render "section" do %}

  ## The Time is Now

  Better late than never!

  {{ session_button }}
  {:style="margin-block-start:var(--sl-spacing-3x-large)"}

{% end %}

{%@ AdvanceBooking blocked_dates: [] %}