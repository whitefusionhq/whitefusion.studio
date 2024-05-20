###ruby
front_matter do
  layout :page
  title "Book Your Guide"
end
###

html -> { <<~HTML # rubocop:todo Metrics
  <iv-fetch id="signed" href="/booking/signed-in" style="display: block">
    <p class="professional-photograph" style="translate: 0 -1.25rem">
      <img src="/images/jared-studio-professional.jpg" alt="photo of Jared White" width="360" />
    </p>
    #{
      html <<~MARKDOWN, -> { markdownify }
        When you need "**Dev Therapy**", ==the Doctor is in!==

        Some people call ==Jared== the “code whisperer”. He will coach you, mentor you, help you get **unstuck**—whether it's on the frontend, the backend, documentation, or governance.

        Ask ==Jared== to adjudicate when there’s a _real difference_ of opinion on your team. Seek a bit of **outside counsel** to make *meaningful* progress on reducing your tech debt, increasing understanding, and faciliating codebase health. Time to _get educated_ and take an empowering step forward. ==Here we go!==

        ----
        {: style="margin-block: var(--sl-spacing-2x-large)"}
      MARKDOWN
    }
  </iv-fetch>
  <iv-form><form action="/booking/submit" method="post" style="max-width: 70ch; margin-inline: auto; margin-block-end: var(--sl-spacing-4x-large)">
    <p class="lead" style="text-align:center">
      Select a time you'd like to schedule for your Zoom face-to-face.
    </p>

    <form-errors data-empty-on-submit>#{text -> { data.errors }}</form-errors>

    #{
      render AdvanceBooking.new(
        blocked_dates: site.data.blocked_dates.dates,
        label: "What kind of session are you looking for?",
        placeholder: "Choose an available time…"
      ) do |c|
        c.slot :free do
          html -> { %(Zoom zoom! <strong>$0</strong> (15m)) }
        end
        c.slot :double do
          html -> { %(Make mine a double! <strong>$349</strong> (2h)) }
        end
        c.slot :day do
          html -> { %(Team for a day! <strong>$999</strong> (4-6h)) }
        end

        html -> { <<~HTML
          <p style="text-align: right; font-size: var(--sl-font-size-small); color: var(--alternate-faded-color)">(All times are <strong>U.S. Pacific</strong>.)</p>
        HTML
        }
      end }

    <checkout-action>
      <p>
        <sl-button variant="primary" type="submit" pill>
          <sl-icon free-options slot="suffix" name="balloon-fill"></sl-icon>
          <ui-label free-options>All Ready to Go</ui-label>
          <sl-icon hidden paid-options slot="suffix" name="credit-card-fill"></sl-icon>
          <ui-label hidden paid-options>Enter Payment Details</ui-label>
        </sl-button>
      </p>

      <p style="font-size: var(--sl-font-size-x-small); margin-block-start: var(--sl-spacing-2x-large); text-wrap: balance">For paid sessions, we will capture your payment details but we <em>won't</em> make the charge until after your appointment has concluded. <strong>Question:</strong> Are you an <a href="https://plus.intuitivefuture.com" target="_blank">Intuitive+</a> member? You get a <mark>15% discount</mark> off any stated price!</p>
    </checkout-action>
    <un-scripted>
      <p>➡️ JavaScript doesn't seem to be running, but that's OK! We can still set you up with a free time slot.</p>

      <p>
        #{render AdvanceBookingNojs.new(blocked_dates: site.data.blocked_dates.dates, label: "", placeholder: "Choose an available time…")}
      </p>
      <p>
        <button>Let's Go!</button>
      </p>
    </un-scripted>
  </form></iv-form>

  #{
    html <<~MARKDOWN, -> { markdownify }
      {: style="text-align: center"}
      ## Possible Conversations

      {: style="text-align: center"}
      Wondering what we might talk about during our session together? Here are a few examples:

      <conversational-grid markdown="block">

      > "Our **design system** has gotten unwieldy and we're having a hard time making improvements. How might we solve this for the next major release?"

      > "We're investigating replacing some of our React components with **HTML web components**. Are there any tools and techniques we should be looking at?"

      > "The microservices we deployed are taking up **way too much time** for our team to maintain. What's a good approach for pulling some functionality back into our monolith?"

      > "I'm a junior developer and it's hard to stand out from the crowd with my skillset. What do I need to know to make a splash and **showcase the value** I know I can provide?"

      > "Our **content team** is split. Some folks want to stick with Markdown in a Git repo, other folks want more of a visual CMS editor. How do we square this circle?"

      > "We've been a **Ruby shop** for many years, but our team is growing to include more TypeScript developers. Is it time to bid farewell to Ruby and just develop with TypeScript?"

      > "I'm been developing frontends in **HTML/CSS/JS** for years but I'd like to branch out into fullstack development…maybe even explore some other languages. What should I do to plan my educational path efficiently?"

      > "We'd like to investigate moving from Active Record to **Sequel** so it's easier to break off parts of our app to write in other Ruby frameworks like **Roda**. How can we do this without major downtime?"

      > "I'm currently the **maintainer** of an open source project that's loosely promoted by my employer, but I'm not sure how to encourage more co-workers to join and **contribute meaningfully**. What's a good governance structure here?"

      > "We're ramping up our content creation efforts but want to make sure we're taking advantage of new open social media opportunities in the **Fediverse** and the like. How might we host and distribute content ourselves as much as possible?"

      > "Our website is a mess and we want to get a whole new **Bridgetown installation** up and running which would integrate with our backoffice software. Can we map out a strategy for loading content from data sources at build time?"

      > "Our Ruby on Rails application is **years out of date** and needs upgrading to the latest gems and security updates. We're also not sure how to take advantage of the lastest frontend pipelines like esbuild. Is there a way to audit our repo?"

      > "We're working through some substantial changes to our codebase to support upcoming features and need some additional expertise in **code review** and documenting architecture. Can we pull you into our process?"

      > "A previous group seems like it injected a lot of bad code, perhaps from **an LLM**, into the repo to implement a feature quickly and then left the project. How do we bring the quality up to our revised standards?"

      </conversational-grid>

      ----

      Any of these ideas resonate with you?
      {: style="text-align: center"}
    MARKDOWN
  }

  <style>
    conversational-grid {
      margin-block-start: var(--sl-spacing-3x-large);
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: var(--sl-spacing-2x-large);

      & > blockquote {
        margin-block-end: 0;
        translate: none;
        outline: 2px solid var(--sl-color-amber-100);

        @media (max-width: 800px) {
          font-size: var(--sl-font-size-small);
        }
      }
    }
  </style>

  <script type="module">
    const group = document.querySelector("sl-radio-group[name='session_type']")
    group.addEventListener("sl-change", (event) => {
      if (event.target.value == "free") {
        document.querySelectorAll("[free-options]").forEach(item => item. hidden = false)
        document.querySelectorAll("[paid-options]").forEach(item => item. hidden = true)
      } else {
        document.querySelectorAll("[free-options]").forEach(item => item. hidden = true)
        document.querySelectorAll("[paid-options]").forEach(item => item. hidden = false)
      }
    })
  </script>
HTML
}
