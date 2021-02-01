---
layout: page
title: Open Source Technology
---

Open source beats at the heart of everything we do. We’ve successfully made more than a millions dollars over years of web development taking full advantage of the open source software ecosystem—particularly Ruby on Rails. Now it’s time for us to give back to this community, starting with Bridgetown.

### Bridgetown

{:.lead}
The Ruby-Powered Static Site Generator for the Jamstack Era

<a href="https://github.com/bridgetownrb/bridgetown" style="margin-right:var(--sl-spacing-xxx-small)"><sl-icon name="github"></sl-icon>GitHub</a> ✦ <a href="https://www.bridgetownrb.com"><sl-icon name="globe"></sl-icon>Website</a>

It all started in the spring of 2020 as a fork of Jekyll, but since then—thanks to the wonderful support and enthusiasm of the open source community—Bridgetown has settled into its own unique identity and has evolved to offer unparalleled flexibility and innovation. Many developers, businesses, and publishers are now using Bridgetown to build new websites and online experiences ([including this one!](https://github.com/whitefusionhq/whitefusion.studio)).

Whitefusion is "all in" for Bridgetown in 2021 and has big plans to make it not just a great Ruby-powered site generator, but a central part of the **Dreamstack** to rival major competitors. Despite the claims of some, the "future" of websites is _not_ React frontends, GraphQL calls, and serverless functions (in our estimation). But what is? WordPress??

This our chance as Rubyists to define <mark>the next ten years of the Jamstack.</mark> Which brings us to the next item on our list:

### Rails Nano

{:.lead}
An API for Your Bridgetown Site

<mark markdown="span">_Coming Q1 2021!_</mark> So you build a static site using Bridgetown. Publishing content is a breeze. But now you want to add payments. Now you want to handle complex forms. Now you want to add a dashboard with some live reporting. Now you want to put some content behind a paywall. Now you want to add specialized editing functionality.

**You need an API for your website.** And what better way is there for Rubyists at large to create an API than to use Rails?

However, stock Rails is pretty overwhelming. You get a ton of frameworks out of the box you might not need. It's unclear how to strip it down to the studs.

We're building **Rails Nano** as the answer to that conundrum. Jumpstart a _tiny_ backend API folder living <mark>inside your Bridgetown site repo</mark> with just a single command, and add additional frameworks only if and when necessary. Render up-to-the-second HTML using the same Bridgetown templates as your static builds. Deploy via a number of potential solutions depending on your topology preference and traffic projections. It's the <mark>Dreamstack</mark> fully-realized: APIs _and_ Markup all expressed through Ruby-based solutions.

### Ruby2JS

{:.lead}
An Extensible Ruby to Modern JavaScript Transpiler

<a href="https://github.com/ruby2js/ruby2js" style="margin-right:var(--sl-spacing-xxx-small)"><sl-icon name="github"></sl-icon>GitHub</a> ✦ <a href="https://www.ruby2js.com"><sl-icon name="globe"></sl-icon>Website</a>

With Ruby fueling both SSG (Static Site Generation) and SSR (Server Side Rendering), what about CSR (Client Side Rendering)? Is it actually possible to write your frontend code (using Stimulus, web components, etc.) with Ruby too?

The Ruby2JS project aims to solve that question. While it's not a true Ruby runtime in the way that the Opal project is, it does make it possible to use Ruby syntax and many familiar conventions to write code that can be transpiled 1:1 to JavaScript. Not only do you get the benefits that come with "thinking in Ruby" full-stack, but the output JS files are so nicely formatted, <mark>they often appear as if they had been hand-coded!</mark>

Working source maps and Webpack integration complete the picture, providing a fantastic alternative to raw JS source code. We're excited to have recently become **regular contributors** to this project and are already using it to build production-ready frontends moving forward.

_Stay tuned for the official release of CrystallineElement, a LitElement-powered "base class" we're now using to write all our Ruby2JS web components._

### Serbea

{:.lead}
Similar to ERB, Except Awesomer

<a href="https://github.com/bridgetownrb/serbea" style="margin-right:var(--sl-spacing-xxx-small)"><sl-icon name="github"></sl-icon>GitHub</a> ✦ <a href="https://www.serbea.dev"><sl-icon name="globe"></sl-icon>Website</a>

What if you combined the best ideas from “brace-style” template languages such as Liquid, Nunjucks, Twig, Jinja, Mustache, etc.—and applied them to the world of ERB? <mark>That's Serbea.</mark> You can use Serbea in Rails applications, Bridgetown static sites, or pretty much any Ruby scenario you could imagine.

Use existing helpers as filters in expressions such as {% raw %}`{{ "My Link" | sub: "Link", "Page" | link_to: route_path }}`{% endraw %}, use the "pipeline operator" in any Ruby code not just templates, <mark>add frontmatter to Rails app views</mark>, and so much more.

We've been using Serbea in-house for several months already and are just starting to roll it out to the open source world at large. We think it's going to grow into a popular superset of ERB utilized by developers of Bridgetown and Rails sites alike.

### Posture

<mark markdown="span">_Coming Q2 2021!_</mark> Our first consumer-facing software product, Posture is a better way to engage with the news. Bringing HEY-like "first principles" design thinking to the world of news feeds, and fully open-source from the start using a Forem-like development model, we hope Posture will appeal to those unsatisfied with the current state of feed readers. **To be continued…**

### Yours?

Working on an open source Ruby project of your own? Need advice, mentorship, or additional development resources? Looking for support on any of the above projects?

<sl-button type="primary" size="large" pill onclick="document.querySelector('sl-dialog').show()">We're Here to Help</sl-button>

----

Wondering how we put all these tools to good use for our website projects? Read our [Methodology](/methodology/) page to find out.

