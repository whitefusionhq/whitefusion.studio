---
layout: page
title: Methodology
---

{:.lead}
Here's how we build websites and web applications in 2024.
{:style="text-align:center"}

<p><sl-button variant="primary" size="large" pill onclick="document.querySelector('sl-dialog').show()">Let Us Do This for You</sl-button></p>
{: style="text-align: center"}

### HyperText Markup Language

<details markdown="block">
  <summary markdown="span">
  We're going to go out on a limb and declare that HTML—in all its piecemeal and compromised glory—is the greatest "semantic communication syntax” ever invented by humanity. Thus it's a real shame how abused and neglected **HTML** has gotten in some corners of the industry over the years. Our skin crawls at the mere hint of HTML as a low-level “machine format” never intended for reading and writing by mere mortals.
  </summary>

  Despite its many critics, HTML has not only survived against the onslaught of numerous competing systems over its 35-year history, it has so solidly established itself as a universal and boundary-defying cultural treasure that we have no doubt ::HTML will still be with us 100 years from now.::

  We prize and value HTML. _Everything starts with HTML._ Before we consider what CSS or JS frameworks to use, what build tooling to introduce, where to store and retrieve data, how to deploy the final product, and so forth, we start with the breadth of meaning and functionality we wish to express through HTML. It’s the _baseplate_ of all web development.
</details>

### Custom Elements

<details markdown="block">
  <summary markdown="span">
  As we begin to build out the structure of the site in generalized templates, we consider which _built-in and custom elements_ we'll need for expressing the intent of each section of each page. There are many built-in elements in HTML and they should always be prioritized wherever suitable.
  </summary>

  `<nav>` for a navbar. `<h1>` for a primary heading. `<article>` to represent a unit of content.  But for situations where a custom element is required, we will liberally define and use those throughout our projects—tag names such as `<layout-column>`, `<ui-label>`, `<footer-inner>`, or `<main-content>`.

  We’ve essentially stopped using `<div>` and `<span>` in all projects going forward because they convey no semantic meaning and serve no useful purpose in an era when ::custom elements are baked into the fabric of the HTML standard.:: In case there’s any confusion, we’re _not_ talking about web components (yet). In our lexicon, custom elements are HTML-only tags which _optionally_ can be used for styling via CSS or scripting via JavaScript. In the case of the latter, read on…
</details>

### Web Components

<details markdown="block">
  <summary markdown="span">
  The emergence of the web components standard is perhaps the greatest leap forward for HTML since the arrival of the `<img>` tag. With web components, you can program bits of encapsulated functionality which are able to be embedded in any web page “natively”.
  </summary>

  For example, HTML provides a `<textarea>` tag. But anyone could write their own `<fancy-textarea>` tag which uses either `<textarea>` under the hood or offers a bespoke editor built out of other HTML/CSS/JavaScript primitives. To you, the downstream HTML author, it doesn’t matter. Use `<textarea>` or `<fancy-textarea>` or `<super-dee-dooper-textarea>` because of the capability each component affords, not because of its implementation details.

  Some legacy JavaScript component libraries such as **React** have struggled to fully embrace and encorporate web components. ::That's on them, not a knock against the web components spec.:: We choose to utilize newer, lightweight libraries which take full advantage of web components and well as other modern patterns such as signals.

  We sometimes may opt to write frontend code in a Ruby-derived syntax with 1:1 transpilation provided by [Ruby2JS](https://www.ruby2js.com){:target="_blank"}. Because there’s no runtime required, the output JavaScript looks much the same as if we hand-coded it ourselves. Pretty neat! (See our [Tech Specs](/tech/) page for further details.)
</details>

### Token-based Semantic CSS Design Systems

<details markdown="block">
  <summary markdown="span">
  Building upon the semantic elements and web components methodology above, we have recently made a fundamental upgrade to our approach to CSS (Cascading Style Sheets). It’s a methodology so new we’re not entirely sure there’s a name for it yet, but it all starts with CSS Custom Properties/Variables and some forward-looking syntactic sugar provided by [PostCSS](https://postcss.org/){:target="_blank"}.
  </summary>

  We start by defining a series of “tokens” as custom properties defined on `:root` in a global stylesheet. We often co-mingle them with tokens imported from a library such as [Open Props](https://open-props.style) or [Shoelace](https://shoelace.style) (more on that below). Example tokens might be `--base-font-size: 125%`, `--primary-color: #ff6f59`, or `--max-content-width: 50rem`. We even create tokens for responsive breakpoints (not yet browser-native, but enabled by PostCSS). You can see these sorts of `:root`-based design tokens on this very website by opening your developer inspector.

  After a basic design system is in place, we begin creating styles using only element names as selectors. `section`, `p`, `a`, `main`, etc.—as well as custom elements such as `navbar-inner`. We use classes sparingly (no `.foo.bar .baz` here!) while readily reaching for attribute selectors, especially for custom elements, e.g. `sl-input[size="medium"]`. Occasionally we might override design tokens for particular element scopes, or within responsive media queries. In addition, when using web components which offer CSS Shadow Parts for advanced styling, we’ll use those as well when strictly necessary (`sl-dialog::part(title)` for example).

  This combination of CSS Variables, element/attribute selectors, and the mechanisms provided by Shadow DOM + Parts has resulted in a ::shocking reduction in the amount of CSS we write as well as import.:: In the past you couldn’t do much quickly without reaching for something like Bootstrap. Lately that would be the main selling point of Tailwind. ([Er, use with extreme caution!](https://www.spicyweb.dev/why-tailwind-isnt-for-me/){:target="_blank"}). However, we increasingly find ourselves not needing any “CSS framework” at all…only some simple boilerplate and typically a web component-based UI library such as **Shoelace**.
</details>

### Shoelace

<details markdown="block">
  <summary markdown="span">
  ==_Soon to become [Web Awesome](https://blog.fontawesome.com/web-awesome-kickstarter/)!_== Created by Cory LaViska, [Shoelace](https://shoelace.style){:target="_blank"} is the most impressive unified collection of web components and design tokens we’ve seen to date. That’s saying a lot considering there are component libraries out now from Salesforce, Microsoft, Google, Adobe, GitHub, and many other large companies.
  </summary>

  Shoelace at first glance might seem like Yet-Another-Bunch-o’-Components with the usual suspects of buttons, icons, menus, and dropdown—however, such simple appearances can be deceiving. What makes Shoelace so impressive are five things:

  0. ::It looks great right out of the box.::
  1. It takes full advantage of modern web component standards.
  2. It’s extremely customizable, but only if you really need to.
  3. The HTML you write using Shoelace is fantastically elegant.
  4. ::Shoelace ships with a comprehensive set of design tokens you can use directly.::

  A button in Shoelace is `<sl-button>Hi!</sl-button>`. An icon is `<sl-icon name="person-circle"></sl-icon>`. A star rating is `<sl-rating precision=".5" value="2.5"></sl-rating>`. On that last example, you can see how element attributes allow for precise control over various component properties. All properties are also controllable of course through JavaScript while requiring no additional library or framework of any kind.

  You can customize how Shoelace looks simply by overriding various design tokens via CSS variables, and you can also use Shoelace tokens directly in your own styles and markup—_even inside of inline styles!_ For example: `<h1 style="margin-bottom:var(--sl-spacing-2x-large)">Lots of Space</h1>`

  We regularly reach for Shoelace as the default UI library for ambitious projects, and love that it pairs so well with a variety of design systems and frontend stacks.
</details>

### Bridgetown + Roda: <nobr>Like Peanut Butter & Jelly</nobr>

<details markdown="block">
  <summary markdown="span">
  Now that our basic frontend stack is set, let’s turn our attention to the backend. We unabashedly employ **Ruby** for its natural language-like expressiveness and object-oriented intellectual rigor. Ruby was designed from the ground-up to maximize programmer happiness and endow tiny teams with fantastic productivity. ::It's our "force multiplier" secret sauce to get more done with less.::
  </summary>

  When evaluating the backend technology for a project, we start by examining the type of project, how it will be used, and what is expected by its audience. Working backward from user experience, we choose the appropriate developer experience we believe makes the most sense.

  Typically, if the site is a “publication”…meaning it’s essentially content-driven (e.g., marketing sites/brochureware, blogs, educational destinations, etc.), then we’ll go the static site route and use **Bridgetown**.

  If the site is primarily a dynamic application orbiting a database—requiring user authentication and up-to-the-second live data—we’ll build out a fullstack [Roda](http://roda.jeremyevans.net) app with Sequel and Rodauth to offer the necessary dashboard, API endpoints, and more.

  Increasingly though, we're finding that Bridgetown's ::static-first approach:: (aka "Jamstack") coupled with ==dynamic routes== powered by its native integration of Roda is a potent combination for a variety of applications. It's true we have extensive experience with Rails as well. But this year, we're taking the bits we like and paring them with a _dramatically different (and much cheaper!) take on Ruby web development_. Best of both worlds? **Most definitely!**
</details>

### Cloudinary

In a break from conventional wisdom, we generally shy away from relying on third-party APIs for functionality. Sure, using APIs for things like email delivery or error monitoring is pretty much a given. Otherwise we believe in the value of building and hosting features in-house. That being said, there is an external API we add to virtually every project we work on—no matter the stack—and that is [Cloudinary](https://cloudinary.com){:target="_blank"}.

Cloudinary, simply put, is a CDN and live transformation service for images and videos. You upload high-resolution, large-size images to Cloudinary, and then you ask Cloudinary back for exactly the size, quality, and format you need. They all get transformed on the fly and subsequently cached for maximum performance. Files can be stored and retrieved solely through Cloudinary’s API, or they additionally provide a full web-based UI where you can view, edit, upload, and delete images. ::It’s about as awesome as image management can get.::

### Markdown

As a shorthand method of authoring textual content intended for HTML generation, Markdown has become a defacto standard. We love Markdown, and we constantly reach for tools (both native apps as well as web services or libraries) that make working with Markdown a delight. We’ve helped train non-technical content authors how to utilize Markdown effectively, and we’re committed to building better editing experiences ::that take Markdown to greater heights without sacrificing the developer story.::

### Next-Generation Hosts

The story of web hosting has changed dramatically over the past few years. Between hosting companies like Render or Vercel offering essentially _free hosting_ for static sites, you can get **incredible performance and full scalability and security at minimal cost**. And for more powerful dynamic Ruby applications, convention-over-configuration hosts such as Render, Fly.io, and Railway are changing the way we deploy applications by focusing out-of-the-gate on simple framework detection, containerization, and multi-region availability.

This is a rapidly-evolving space and what makes sense today might not make sense tomorrow. Generally speaking, we're not super-thrilled with that sort of churn. ::But we're bullish on next-gen hosting solutions which place zero-config or easily-configurable build artifacts at their core.:: We're trying our best to work out the kinks, document our findings, and make this easier for everybody. May the best cloud win.

----

For more information on some of the tools we use and build on projects like these, visit our [Tech Specs](/tech/) page. Or visit [Resources](/resources/) to learn more about applying techniques such as these to your own projects.

<sl-button variant="primary" size="large" pill onclick="document.querySelector('sl-dialog').show()">Great! Let’s Build Something</sl-button>
