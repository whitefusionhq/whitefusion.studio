# route: POST /submit-booking/
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

  puts r.params

  if submitted_date.to_s.empty?
    error_message = -> { "Please select a suitable time for your session." }
    unless r.invocably?
      book_page = bridgetown_site.collections.pages.resources.find { _1.relative_url == "/book/" }
      book_page.data.errors = html -> { %(<p>#{text error_message}</p>) }
      next book_page
    end

    next r.respond_invocably do
      html -> { <<~HTML
        <form-errors>
          <p data-function="replaceChildren">#{text error_message}</p>
        </form-errors>
      HTML
      }
    end
  end

  r.session[:submitted_date] = submitted_date

  next r.redirect("/auth/signup") if session_type == "free"

  (session_type == "morning" ? r.params[:morning_date] : r.params[:hour_date]).then do
    real_time = _1.tr("_", " ")
    Time.parse(real_time).to_datetime.strftime("%A, %B %-d, %Y @ %I:%M %p")
  end => selected_date

  case Bridgetown.env
  when "production"
    session_type == "morning" ? "A" : "B"
  else
    session_type == "morning" ? "price_0LL8dCRCdX9HFRHF10zvgie3" : "price_0LH7SWRCdX9HFRHFcFnLdK1N"
  end => price

  {
    line_items: [{
      price:,
      quantity: 1,
    }],
    payment_intent_data: {
      metadata: {
        session_type:,
        selected_date:,
      },
    },
    mode: "payment",
    success_url: absolute_url("/successful/"),
    cancel_url: absolute_url("/canceled/"),
  } => payload

  session = Stripe::Checkout::Session.create(payload)

  next r.redirect(session.url) unless r.invocably? # TODO: currently the form doesn't support this

  r.respond_invocably do
    html -> { <<~HTML
      <checkout-action>
        <p data-function="replaceChildren">
          <strong>Awesome!</strong> Loading Stripe Checkout…
        </p>
        <redirect-to data-function="append" href="#{text -> { session.url }}" delay="1500"></redirect-to>
      </checkout-action>
    HTML
    }
  end
end
