---
layout: page
title: Open Source Technology
---

Open source beats at the heart of everything we do. Our million-dollar success story over years of web development is directly due to the advantages provided by the open source software ecosystem—particularly Ruby on Rails. Now, it’s our time to give back to this amazing community, starting with Bridgetown.

### Bridgetown

{:.lead}
A next-generation, progressive site generator & fullstack framework, powered by Ruby.

<a href="https://github.com/bridgetownrb/bridgetown" target="_blank" style="margin-right:var(--sl-spacing-3x-small)"><sl-icon name="github"></sl-icon>GitHub</a> ✦ <a href="https://www.bridgetownrb.com" target="_blank"><sl-icon name="globe"></sl-icon>Website</a>

It all started in the spring of 2020 as a fork of Jekyll, but since then—thanks to the wonderful enthusiasm and financial support of the open source community—Bridgetown has forged its own unique identity and evolved to offer unparalleled flexibility and innovation. Many developers, businesses, and publishers are now using Bridgetown to build new websites and online experiences ([including this one!](https://github.com/whitefusionhq/whitefusion.studio){:target="_blank"}).

Whitefusion is "all in" for Bridgetown in 2022 and has big plans to make it not just a great Ruby (and [Roda](http://roda.jeremyevans.net){:target="_blank"}) framework by itself, but a central part of the **Dreamstack** to rival major competitors. We believe that—despite the claims of some—the future of website production is _not_ React frontends, GraphQL calls, and serverless functions. But what is? WordPress?? 😋

This our chance as Rubyists to define ::the next ten years of building digital experiences and publications.::

### Serbea

{:.lead}
Similar to ERB, Except Awesomer

<a href="https://github.com/bridgetownrb/serbea" target="_blank" style="margin-right:var(--sl-spacing-3x-small)"><sl-icon name="github"></sl-icon>GitHub</a> ✦ <a href="https://www.serbea.dev" target="_blank"><sl-icon name="globe"></sl-icon>Website</a>

What if you combined the best ideas from “brace-style” template languages such as Liquid, Nunjucks, Twig, Jinja, Mustache, etc.—and applied them to the world of ERB? ::That's Serbea.:: You can use Serbea in Rails applications, Bridgetown static sites, or pretty much any Ruby scenario you could imagine.

Use existing helpers as filters in expressions such as {% raw %}`{{ "My Link" | sub: "Link", "Page" | link_to: route_path }}`{% endraw %}, use the "pipeline operator" in any Ruby code not just templates, ::add front matter to Rails app views::, and so much more.

We've been developing and using Serbea in-house on production projects, and now it's available to the open source world at large. **We think Serbea will grow into a popular superset of ERB enjoyed by developers of Bridgetown and Rails sites alike**.

### Ruby2JS

{:.lead}
An Extensible Ruby to Modern JavaScript Transpiler

<a href="https://github.com/ruby2js/ruby2js" target="_blank" style="margin-right:var(--sl-spacing-3x-small)"><sl-icon name="github"></sl-icon>GitHub</a> ✦ <a href="https://www.ruby2js.com" target="_blank"><sl-icon name="globe"></sl-icon>Website</a>

With Ruby fueling both SSG (Static Site Generation) and SSR (Server-Side Rendering), what about CSR (Client-Side Rendering)? Is it actually possible to write your frontend code (using Stimulus, web components, etc.) _with Ruby too_?

**The Ruby2JS project aims to resolve that question.** While it's not a true drop-in Ruby runtime, it does enable the ability to utilize Ruby syntax and many familiar conventions to write code that will be transpiled 1:1 to JavaScript. Not only do you get the benefits that come with "thinking in Ruby" as you write frontend code, but the output JS files are so nicely formatted, ::they often appear as if they had been hand-coded!::

Working source maps plus esbuild or Webpack integration completes the picture, providing a fantastic alternative to raw JS source. We're very excited to have become **regular contributors** to this project and are already using it to build ::production-ready frontends moving forward.::

### In The Works…

As of Q3 2022, we've got a few more projects in the hopper as well—from new Roda plugins to a Bridgetown-based content paywall solution. In particular, we're pretty excited about [Lifeform](https://github.com/bridgetownrb/lifeform){:target="_blank"}, an object-oriented form builder which works in Bridgetown, Rails, and virtually any Ruby web framework which supports the `render_in` view convention. _Stay tuned!_

### Yours?

Working on an open source Ruby project of your own? Need advice, mentorship, or additional development resources? Looking for support on any of the above projects?

<sl-button variant="primary" size="large" pill onclick="document.querySelector('sl-dialog').show()">We're Here to Help</sl-button>

----

Wondering how we put all these tools to good use for our website projects? Read our [Methodology](/methodology/) page to find out.

