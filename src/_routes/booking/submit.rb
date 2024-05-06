def continuing_message(message, redirect_url, delay: 1000)
  html -> { <<~HTML
    <checkout-action>
      <p data-invocably="replaceChildren">
        <strong>Awesome!</strong> #{text -> { message }}
      </p>
      <redirect-to data-invocably href="#{text -> { redirect_url }}" delay="#{text -> { delay }}"></redirect-to>
    </checkout-action>
  HTML
  }
end

# route: POST /booking/submit/
r.post do # rubocop:disable Metrics/BlockLength
  r.params[:session_type] => session_type
  session_type = "free" unless r.params[:free_date_no_js].to_s.empty?

  submitted_date =
    case session_type
    when "free"
      r.params[:free_date] || r.params[:free_date_no_js]
    when "morning"
      r.params[:morning_date]
    when "hour"
      r.params[:hour_date]
    when ""
      nil
    end

  if submitted_date.to_s.empty?
    error_message = -> { "Please select a suitable time for your session." }
    unless r.invocably?
      book_page = site.collections.pages.find { _1.relative_url == "/book/" }
      book_page.data.errors = html -> { %(<p>#{text error_message}</p>) }
      next book_page
    end

    next r.invocably do
      html -> { <<~HTML
        <form-errors>
          <p data-invocably="replaceChildren">#{text error_message}</p>
        </form-errors>
      HTML
      }
    end
  end

  response.set_cookie :submitted_date, value: submitted_date, expires: Time.now + (60 * 60)
  response.set_cookie :session_type, value: session_type, expires: Time.now + (60 * 60)

  if session_type == "free" || current_user&.stripe_customer_id
    redirect_url = rodauth.logged_in? ? "/account/profile" : "/auth/create-account"
    next r.redirect(redirect_url) unless r.invocably?

    next continuing_message("Continuing on…", redirect_url)
  end

  #############################################################################
  # If the session requires Stripe payment and we don't have one on file,
  # time to head over to Stripe Checkout.
  #############################################################################

  (session_type == "morning" ? r.params[:morning_date] : r.params[:hour_date]).then do
    real_time = _1.tr("_", " ")
    Time.parse(real_time).to_datetime.strftime("%A, %B %-d, %Y @ %I:%M %p")
  end => selected_date

  {
    currency: "usd",
    customer_email: current_user&.email,
    setup_intent_data: {
      metadata: {
        session_type:,
        selected_date:,
      },
    },
    mode: "setup",
    success_url: absolute_url("https://4000.dev.whitefusion.studio/account/complete-checkout/?session_id={CHECKOUT_SESSION_ID}"),
    cancel_url: absolute_url("/canceled/"),
  } => payload

  session = Stripe::Checkout::Session.create(payload)

  next r.redirect(session.url) unless r.invocably? # TODO: currently the form doesn't support this

  r.invocably do
    continuing_message("Loading Stripe Checkout…", session.url, delay: 1500)
  end
end
