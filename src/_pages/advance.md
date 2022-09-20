---
layout: landing_page
title: Advance
page_class: page
template_engine: serbea
---

{% session_button = capture do %}
  <p><sl-button href="/advance/book" variant="primary" size="large" pill>
    Book Your Session Now
  </sl-button></p>
{% end.strip.then(&method(:redent)) %}

{% content_for :top_lead do %}
  {:.lead}
  Our expertise at your fingertips.
  {:style="text-align:center"}

  {{ session_button }}
  {:style="margin-block-start:var(--sl-spacing-3x-large);text-align:center"}
{% end %}

{%= liquid_render "section" do %}

  ## Feeling Overwhelmed?

  The **open web platform** is advancing at a remarkable rate, perhaps faster than we've ever seen before.

  Sure it's been a whirlwind from day one, and seemingly not a day goes by that there's not a new framework or stack everyone's buzzing about.

  But I'm not talking about that. I'm talking about the advancement of the **web itself** at the core level of specs like HTML, CSS, and JavaScript.

  I’m talking about ::massive improvements:: which seem to land on an almost daily basis in every major browser. And there's _no_ sign anyone's about to slow down, not by any stretch.

  So my friends, **the challenge isn't in finding new goodies to consume**. Changelogs and documentation updates and tweets and explainers abound.

  ::That's actually the problem!:: 😱

  There's _too much_ to track. Too much to wrap your head around. **The cognitive load is too damn high.**

  How do you know what’s really the next big thing? What’s not just hype? Or what is mostly hype? What is safe to hold off on? How do you separate the true gold from the fool's gold? How do you know which established wisdom—the "boring tech" that's battle-tested and been around the block—is still relevant for you and your team?

  Or…what if you just have that one gnarly PR lingering around which really needs an outside pair of eyes and a helping hand? What if you simply require some friendly banter alongside a productive review? What if that one pointer in just the right direction gets everything unblocked and progressing smoothly once again?

{% end %}

{%= liquid_render "section", alt_invert: true do %}

  ## Say Hello to Whitefusion Advance. Say Hello to…Well, Me!

  **Hi, I'm Jared.** I live and work in Portland, Oregon. I'm a web developer.

  {: .professional-photograph}
  ![A photo of Jared sitting with his hands folded neatly on the table in front of him](/images/jared-studio-professional.jpg){:width="440"}{:loading="lazy"}{:title="Jared in Hat"}

  Some people know me as [The Bridgetown Guy](https://www.bridgetownrb.com/community). Others [know me for my advocacy](https://www.spicyweb.dev/about) around web components, vanilla CSS design systems, and server-first, HTML-over-the-wire techniques. Or alternatively, [my love of Ruby](https://www.fullstackruby.dev) and how the two halves of fullstack monoliths can intersect.

  As a freelancer, I’m privileged to work on a wide variety of client projects at any given time. I'm routinely exposed to a number of different perspectives, techniques, and teams—as well as different stages of codebases from the new to the legacy and back again.

  Not only that, I’ve built or maintained web sites & apps and open source libraries & frameworks of one sort or another for, well, ::quite a long time::.  ([No joke!](https://web.archive.org/web/19981207071047/http://www.gaeldesign.adei.com/aboutus.html)) But rather than rest on my laurels or become jaded, **I’m as excited about web development as I've ever been**, and I watch new specs and approaches arrive on the scene like a hawk.

  Throw a new CSS property or HTML tag (hello `<dialog>`!) at me and I'm jumping up and down with glee…but I also know how to temper my enthusiasm with experience. Not everything new and shiny is ready for prime time. And some technologies are just a bad idea from the get-go. I was against **SPA (Single-Page Application)**, client-heavy architecture as a _default_ solution for most web projects ::long before it was popular to do so:: The renewed focus in 2022 on "server-driven frameworks" in our industry is quite a thing to behold.

  We see ideas come and go, and come back around again. We see technologies praised one moment as the savior of the internet, and tossed like yesterday's garbage the next. Languages rise. Languages fall. (Actually, that rarely happens. Most of the web-adjacent languages invented in the past two decades are still alive and kicking—including my personal favorite, Ruby.) Work in this biz long enough, it all starts to blur.

  **You're smart. You know all this.** You're able to rise above the fray and get legitimate work done with productive tools. Yet there are times when you doubt yourself, doubt your specific technology choices, doubt you're really on the right track. Knowing which horse to bet on in this industry can be hard, and when you're already busy juggling a ton of projects and tools and team pressures coming in from all sides, how do you even find the time to evaluate every little bit of "progress" that comes along?

  Again, **Say Hello to Whitefusion Advance**. Let me step in to help you!

  {{ session_button }}
  {:style="margin-block-start:var(--sl-spacing-3x-large)"}
{% end %}

{%= liquid_render "section" do %}

  ## Huh, You're Going to Help Me…With What Exactly??

  * Upgrade to Maybe—Just Maybe—The Last Frontend Toolchain You'll Ever Need
  * Weave Web Components (Vanilla, Lit-based, and Beyond) into Your Frontend
  * Build a Truly Modern CSS Design System
  * Migrate Away from Ugly and Rigid Atomic CSS
  * Set Up a Progressive Generation Website Codebase Using Tools Like Bridgetown
  * Adopt The Latest Ruby Ecosystem Advances In IDEs, Debugging, Modern Gems, Deployment Strategies, and More
  * Modernize Your Legacy Rails App to Rails 7 and the Hotwire Stack
  * Establish Best Practices Around Open Source Governance and Community Building
  * And Those are Just Some Ideas Off the Top of My Head! 😲

{% end %}

{%= liquid_render "section", invert: true do %}

  ## How is This Different From "The Spicy Web"?

  As mentioned above, I run a website called [The Spicy Web](https://www.spicyweb.dev) which publishes articles & videos and runs a Discord server to help people learn all about vanilla HTML, CSS, & JavaScript techniques, as well “Use The Platform” tools and approaches to web development. Paid courses are also in the works for a subscription platform coming out later in 2022.

  Essentially **Whitefusion Advance** is the “consulting/mentoring” side of The Spicy Web coin. I expect that, over time, more of what I help folks with in 1:1s becomes educational materials available through The Spicy Web courses—and conversely, more and more requests for direct assistance by patrons of The Spicy Web will fuel engagements with **Advance**. In the end, everybody wins. ☺️

  {{ session_button }}
  {:style="margin-block-start:var(--sl-spacing-3x-large)"}

{% end %}

{%= liquid_render "section" do %}

## OK Fine, You've Convinced Me. How Do I Get Advance?

**Whitefusion Advance** lets you choose from two preset engagements:

### Hour+

You can hire me for an hour (a little over is totally fine). Great for a quick review, a targeted question, or an overview of an advanced topic.

### Morning+

You can hire me for an in-depth work session roughly between breakfast and lunch time (based on U.S. time zones).

You sign up for a scheduled time, I send you a Zoom invite link, and before you know it, we're working to solve problems together. How cool is that?!

## Sounds Great! Let's Do This Thing

[Yeeeaaahhh!](https://www.youtube.com/watch?v=9WX6Y6h-LFg)

::[ BOOK NOW ]::

## But What If You Really Can’t Help Me?

If I can’t help you, I’ll know someone who can. I have…connections. 😉

But honestly, most of the time if I don’t have an immediate path forward to suggest for a particular problem, I’m very willing and able to put in the time to research it. From years of trial and error, I’ve discovered some solid rules of thumb for how to separate the wheat from the chaff (so to speak) in online forums and other obscure corners of discourse.

I’m also quite active on GitHub beyond my own open source projects—filing issues and sometimes submitting PRs as necessary to contribute to the overall ecosystem. Sometimes fixes for the headaches my clients experience turn into literal upgrades of open source libraries and frameworks! Everybody wins. (Sorry, I know I already said that… 😅)

So, convinced yet?

{% end %}