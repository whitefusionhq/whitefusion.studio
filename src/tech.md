---
layout: page
title: Open Source Technology
---

Open source beats at the heart of everything we do. Our million-dollar success story over years of web development is directly due to the advantages provided by the open source software ecosystem—particularly Ruby on Rails. Now, it’s our time to give back to this amazing community, starting with Bridgetown.

### Bridgetown

{:.lead}
The Ruby-Powered Static Site Generator for the Jamstack Era

<a href="https://github.com/bridgetownrb/bridgetown" target="_blank" style="margin-right:var(--sl-spacing-3x-small)"><sl-icon name="github"></sl-icon>GitHub</a> ✦ <a href="https://www.bridgetownrb.com" target="_blank"><sl-icon name="globe"></sl-icon>Website</a>

It all started in the spring of 2020 as a fork of Jekyll, but since then—thanks to the wonderful support and enthusiasm of the open source community—Bridgetown has settled into its own unique identity and has evolved to offer unparalleled flexibility and innovation. Many developers, businesses, and publishers are now using Bridgetown to build new websites and online experiences ([including this one!](https://github.com/whitefusionhq/whitefusion.studio){:target="_blank"}).

Whitefusion is "all in" for Bridgetown in 2021 and has big plans to make it not just a great Ruby-powered site generator by itself, but a central part of the **Dreamstack** to rival major competitors. We belive that—despite the claims of some—the future of website production is _not_ React frontends, GraphQL calls, and serverless functions. But what is? WordPress??

This our chance as Rubyists to define {% mark %}the next ten years of building digital experiences and publications.{% endmark %} Which brings us to the next item on our list:

### Arch

{:.lead}
The Seemless Backend for Your Bridgetown Site

{% mark %}_Coming Q3 2021!_{% endmark %} OK, so you build a static site using Bridgetown and deploy it on Render or Vercel. Publishing content is a breeze. But now you want to add payments. Handle complex forms. Display a dashboard with live reporting. Put some content behind a paywall. Provide specialized editing functionality.

In other words, **you need a backend for your website.** And what better way is there for Rubyists to create an API than to use a solution built on top of proven tools such as Rake, Rack, and Puma? Welcome to **Arch**. It's a potent blend of Jamstack and traditional monolith development practices to make developing static/dynamic websites a reality.

Jumpstart a _streamlined_ backend folder living {% mark %}inside your Bridgetown site repo{% endmark %} with just a single command. Use [Roda](http://roda.jeremyevans.net){:target="_blank"} out-of-the-box for lightning fast server responses. Add additional frameworks such as Rails only if and when necessary. Render up-to-the-second HTML **using the same Bridgetown templates** as your static builds. Deploy via a number of potential solutions depending on your topology preferences and traffic projections. It's the {% mark %}Dreamstack{% endmark %} fully-realized: APIs _and_ Markup all expressed through Ruby-based solutions. Stay tuned.

### Ruby2JS

{:.lead}
An Extensible Ruby to Modern JavaScript Transpiler

<a href="https://github.com/ruby2js/ruby2js" target="_blank" style="margin-right:var(--sl-spacing-3x-small)"><sl-icon name="github"></sl-icon>GitHub</a> ✦ <a href="https://www.ruby2js.com" target="_blank"><sl-icon name="globe"></sl-icon>Website</a>

With Ruby fueling both SSG (Static Site Generation) and SSR (Server-Side Rendering), what about CSR (Client-Side Rendering)? Is it actually possible to write your frontend code (using Stimulus, web components, etc.) _with Ruby too_?

**The Ruby2JS project aims to resolve that question.** While it's not a true drop-in Ruby runtime, it does enable the ability to utilize Ruby syntax and many familiar conventions to write code that will be transpiled 1:1 to JavaScript. Not only do you get the benefits that come with "thinking in Ruby" as you write frontend code, but the output JS files are so nicely formatted, {% mark %}they often appear as if they had been hand-coded!{% endmark %}

Working source maps plus Webpack or Snowpack integration completes the picture, providing a fantastic alternative to raw JS source. We're very excited to have recently become **regular contributors** to this project and are already using it to build {% mark %}production-ready frontends moving forward.{% endmark %}

_Stay tuned for the official release of CrystallineElement, a LitElement-powered "base class" we're now using to write all our Ruby2JS web components._

### Serbea

{:.lead}
Similar to ERB, Except Awesomer

<a href="https://github.com/bridgetownrb/serbea" target="_blank" style="margin-right:var(--sl-spacing-3x-small)"><sl-icon name="github"></sl-icon>GitHub</a> ✦ <a href="https://www.serbea.dev" target="_blank"><sl-icon name="globe"></sl-icon>Website</a>

What if you combined the best ideas from “brace-style” template languages such as Liquid, Nunjucks, Twig, Jinja, Mustache, etc.—and applied them to the world of ERB? {% mark %}That's Serbea.{% endmark %} You can use Serbea in Rails applications, Bridgetown static sites, or pretty much any Ruby scenario you could imagine.

Use existing helpers as filters in expressions such as {% raw %}`{{ "My Link" | sub: "Link", "Page" | link_to: route_path }}`{% endraw %}, use the "pipeline operator" in any Ruby code not just templates, {% mark %}add front matter to Rails app views{% endmark %}, and so much more.

We've been developing and using Serbea in-house for several months and are just starting to roll it out to the open source world at large. **We think Serbea will grow into a popular superset of ERB enjoyed by developers of Bridgetown and Rails sites alike**.

### Posture

{% mark %}_Coming Q2 2021!_{% endmark %} Our first consumer-facing software product, Posture is a better way to engage with the news. Bringing HEY-like "first principles" design thinking to the world of news feeds, and fully open-source from the start using a Forem-like development model, we hope Posture will appeal to all those unsatisfied with the current state of feed readers. **To be continued…**

### Yours?

Working on an open source Ruby project of your own? Need advice, mentorship, or additional development resources? Looking for support on any of the above projects?

<sl-button variant="primary" size="large" pill onclick="document.querySelector('sl-dialog').show()">We're Here to Help</sl-button>

----

Wondering how we put all these tools to good use for our website projects? Read our [Methodology](/methodology/) page to find out.

