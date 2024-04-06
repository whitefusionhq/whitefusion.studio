###ruby
front_matter do
  layout :page
  title "Book Us"
end
###

html -> { <<~HTML # rubocop:todo Metrics
  <iv-fetch id="signed" href="/signed-booking"></iv-fetch>
  <iv-form>
  <form action="/submit-booking/" method="post" style="min-height: 80vh; max-width: 70ch; margin-inline: auto" data-turbo="false">
    <p class="lead" style="text-align:center">
      Select a time you'd like to schedule for your session.
    </p>

    <form-errors data-empty-on-submit>#{text -> { data.errors }}</form-errors>

    #{
      render AdvanceBooking.new(
        blocked_dates: site.data.blocked_dates.dates,
        label: "What type of session are you looking for?",
        placeholder: "Choose an available time…"
      ) do |c|
        c.slot :free do
          html -> { %(Zoom zoom! <strong>$0</strong> for 30m) }
        end
        c.slot :double do
          html -> { %(Make mine a double! <strong>$349</strong> for 2h) }
        end
        c.slot :day do
          html -> { %(Team for a day! <strong>$999</strong> for 4-6h) }
        end

        html -> { <<~HTML
          <p>(All times are <strong>U.S. Pacific</strong>.)</p>
        HTML
        }
      end }

    <checkout-action>
      <p>
        <sl-button variant="primary" type="submit" pill>
          <sl-icon free-options slot="suffix" name="balloon-fill"></sl-icon>
          <ui-label free-options>All Ready to Play</ui-label>
          <sl-icon hidden paid-options slot="suffix" name="credit-card-fill"></sl-icon>
          <ui-label hidden paid-options>Save Payment Details for Later</ui-label>
        </sl-button>
      </p>
    </checkout-action>
    <un-scripted>
      <p>➡️ JavaScript doesn't seem to be running, but that's OK! We can still set you up with a free time slot.</p>

      <p>
        #{render AdvanceBookingNojs.new(blocked_dates: site.data.blocked_dates.dates, label: "", placeholder: "Choose an available time…")}
      </p>
      <p>
        <button style="font: inherit; font-weight: bold">Let's Go!</button>
      </p>
    </un-scripted>
  </form>
  </iv-form>

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
