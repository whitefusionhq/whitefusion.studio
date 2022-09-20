---
layout: landing_page
title: Advance
page_class: page narrow-layout
template_engine: serbea
---

{% content_for :top_lead do %}

  {%@ AdvanceBooking blocked_dates: site.data.blocked_dates.dates %}

{% end %}