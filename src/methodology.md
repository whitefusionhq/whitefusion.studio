---
layout: page
title: Methodology
---

{:.lead}
Here's how we build websites and web applications in 2021.
{:style="text-align:center"}

### HTML: HyperText Markup Language

<details markdown="block">
  <summary markdown="span">
  It's shameful how abused and neglected HTML has been in some corners of the industry over the years. Some people have even claimed its ultimate destination is as a low-level “machine language” never intended for reading/writing by mere mortals. So we're going to go out on a limb here and declare that HTML—in its purest form—is the greatest "semantic communication syntax” ever invented by humankind.
  </summary>

  HTML has not only survived against the onslaught of many competing systems over its 30+ year history, it has so solidly established itself as a cultural treasure crossing all boundaries of creed, nationality, and purpose that we have no doubt HTML will still be with us 100 years from now.

  We prize and value HTML. Everything starts with HTML. Before we consider what frameworks to use, what tooling to introduce, where to store and retrieve data, how to deploy the final product, and so forth, we start with the breadth of meaning and functionality we wish to express through HTML. It’s the _baseplate_ of all web development.
</details>

### Custom Elements

<details markdown="block">
  <summary markdown="span">
  As we begin to build out the structure of the site in generalized templates, we consider which _built-in and custom elements_ we will need for expressing the intent of each section of each page. There are many built-in elements in HTML and they should always be prioritized wherever suitable.
  </summary>

  `<nav>` for a navbar. `<h1>` for a primary heading. `<article>` to represent a unit of content.  But for situations where a custom element is required, we will liberally define and use those throughout our projects—tag names such as `<layout-column>`, `<ui-label>`, `<footer-inner>`, or `<main-content>`. ([Here’s a definitive article on the topic by Jared White.](https://dev.to/jaredcwhite/custom-elements-everywhere-for-page-layout-parts-i-and-ii-438p))

  We’ve essentially stopped using `<div>` and `<span>` in all projects going forward because they convey no semantic meaning and serve no useful purpose in an era when custom elements are baked into the fabric of the HTML standard. In case there’s any confusion, we’re _not_ talking about web components (yet). In our lexicon, custom elements are HTML-only tags which can _optionally_ be used for styling via CSS or scripting via JavaScript. In the case of the latter, read on…
</details>

### Web Components

<details markdown="block">
  <summary markdown="span">
  The emergence of the web components standard is perhaps the greatest leap forward for HTML since the arrival of the `<img>` tag. With web components, you can program bits of encapsulated functionality which are able to be embedded in any web page “natively”.
  </summary>

  For example, HTML provides a `<textarea>` tag. But anyone could write their own `<fancy-textarea>` tag that either uses `<textarea>` under the hood or offers a bespoke editor built out of other HTML/CSS/JavaScript primitives. To you, the downstream HTML author, it doesn’t matter. Use `<textarea>` or `<fancy-textarea>` or `<super-dee-dooper-textarea>` because of the capability each component affords, not its implementation details.

  Web components pose an existential threat to legacy JavaScript component libraries such as React, which is probably why React is dragging their heels in supporting this web standard. We choose to utilize newer, lightweight libraries which take full advantage of web components—most notably LitElement, as well as Turbo and Stimulus from the Hotwire community.

  We sometimes may opt to write custom component or Stimulus code in a Ruby-derived syntax with 1:1 transpilation provided by Ruby2JS. Because there’s no runtime required, the output JavaScript looks much the same as if we hand-coded it ourselves. (See our [Tech Specs](/tech/) page for further details!)
</details>

### Token-based Semantic CSS Design Systems

<details markdown="block">
  <summary markdown="span">
  Building upon the semantic elements and web components methodology above, we have recently made a fundamental upgrade to our approach to CSS (Cascading Style Sheets). It’s a methodology so new we’re not entirely sure there’s a name for it yet, but it all starts with CSS Variables (sometimes known as Custom Properties) and some forward-looking syntactic sugar provided by PostCSS.
  </summary>

  We start by defining a series of “tokens” as variables defined on `:root` in a global stylesheet. These tokens can either be created by us or we might co-mingle them with tokens imported from a UI library such as Shoelace (more on that below). Examples tokens might be `--base-font-size: 24px`, `--primary-color: #ff6f59`, or `--max-content-width: 50rem`. We even create tokens for responsive breakpoints (not yet browser-native, but enabled by PostCSS). You can see these sorts of `:root`-based design tokens on this very website by opening your developer inspector.

  After a basic design system is in place, we begin creating styles using only element names as selectors. `section`, `p`, `a`, `main`, etc.—as well as custom elements like `navbar-inner` and so forth. We use classes sparingly (no `.foo.bar .baz` here!) while readily reaching for attribute selectors, especially for custom elements: `sl-input[size="medium"]` or `sl-bar-item[size~="6/10"]`. Occasionally we might override design tokens for particular element scopes, or within responsive media queries. In addition, when using web components which offer CSS Shadow Parts for advanced styling, we’ll use those as well when strictly necessary (`sl-dialog::part(title)` for example).

  This combination of CSS Variables, element/attribute selectors, and the mechanisms provided by Shadow DOM + Parts has resulted in a shocking reduction in the amount of CSS we write _as well as import_. In the past you couldn’t do much quickly without reaching for something like Bootstrap. Lately that would be the main selling point of Tailwind. ([Er, use with extreme caution!](https://dev.to/jaredcwhite/why-tailwind-isn-t-for-me-5c90)). However, we increasingly find ourselves not needing any “CSS framework” at all…only some simple boilerplate and typically a web component-based UI library such as Shoelace.
</details>

### Shoelace

<details markdown="block">
  <summary markdown="span">
  Created by Cory LaViska, [Shoelace](https://shoelace.style) is the most impressive unified collection of web components and design tokens we’ve seen to date. That’s saying a lot considering there are component libraries out now from Salesforce, Microsoft, Google, Adobe, GitHub, and many other large companies.
  </summary>

  Shoelace at first glance might seem like Yet-Another-Bunch-o’-Components with the usual suspects of buttons, icons, menus, and dropdown—however, such simple appearances can be deceiving. What makes Shoelace so impressive are five things:

  0. It looks great right out of the box.
  1. It takes full advantage of modern web component standards.
  2. It’s extremely customizable, but only if you really need to.
  3. The HTML you write using Shoelace is fantastically elegant.
  4. Shoelace ships with a variety of design tokens you can use directly.

  A button in Shoelace is `<sl-button>Hi!</sl-button>`. An icon is `<sl-icon name="person-circle"></sl-icon>`. A star rating is `<sl-rating precision=".5" value="2.5"></sl-rating>`. On that last example, you can see how element attributes allow for precise control over various component properties. All properties are also controllable of course through JavaScript while requiring no additional library or framework of any kind.

  You can customize how Shoelace looks simply by overriding various design tokens via CSS variables, and you can also use Shoelace tokens directly in your own styles and markup—even inside of inline styles! For example: `<h1 style="margin-bottom:var(--sl-spacing-x-large)">Lots of Space</h1>`

  Shoelace v2 is a total rewrite and currently in beta, so as usable and impressive as it is now, this is only the beginning. We’re excited about choosing Shoelace as the default UI library for all our latest projects.
</details>

### Bridgetown or Rails: Pick Your Flavor (or Both!)

Now that our basic frontend stack is set, let’s turn our attention to the backend. We unabashedly use Ruby for its English-like expressiveness and object-oriented rigor.

If the site is a “publication” meaning it’s mostly content-driven (marketing sites/brochureware, blogs, educational destinations, etc.), then we’ll go the static site route and use Bridgetown.

If the site is a dynamic application orbiting a database requiring user authentication and up-to-the-second live data, we’ll build out a fullstack Ruby on Rails app using Hotwire-style techniques to provide slick interactive interfaces.

### Markdown

As a shorthand method of authoring textual content intended for HTML generation, Markdown has become a defacto standard. We love Markdown, and we constantly reach for tools (both native apps as well as web services or libraries) that make working with Markdown a delight. We’ve helped train non-technical content authors how to utilize Markdown effectively, and we’re committed to building better editing experiences that take Markdown to greater heights without sacrificing the developer story.

### Cloudinary

In a break from conventional wisdom, we generally shy away from relying on third-party APIs for functionality. Sure, using APIs for things like email delivery or error monitoring is pretty much a given. Otherwise we believe in the value of building and hosting features in-house. That being said, there is an external API we add to virtually every project we work on whether Bridgetown or Rails, and that is Cloudinary.

Cloudinary, simply put, is a CDN and live transformation services for images and videos. You upload high-resolution, large-size images to Cloudinary, and you then ask Cloudinary back for exactly the size, quality, and format you need—and it’s transformed on the fly and subsequently cached for maximum performance. Files can be stored and retrieved solely through Cloudinary’s API, plus they provide a full web-based UI where you can view, edit, upload, and delete images. It’s about as awesome as image management can get.

### Jamstack or Docker-friendly Hosts

The story of web hosting has changed dramatically over the past few years. Between hosting companies like Netlify, Vercel, or Render offering free or nearly-free hosting for “Jamstack” sites (aka built with static site generators such as Bridgetown), you can get incredible performance and full scalability and security at minimal cost. And for more powerful, dynamic Ruby applications, Docker-friendly hosts such as Fly.io, Render, or even DigitalOcean are changing the way we deploy applications by focusing out-of-the-gate on containerization and multi-region availability.

----

For more information on some of the tools we build and use on projects like these, visit our [Tech Specs](/tech/) page. Or visit [Resources](/resources/) to learn more about applying techniques such as these to your own projects.

<sl-button type="primary" size="large" pill onclick="document.querySelector('sl-dialog').show()">Now Let Us Do This for You</sl-button>
