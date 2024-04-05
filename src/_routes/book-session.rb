# route: POST /book-session/
r.post do # rubocop:disable Metrics/BlockLength
  r.params[:session_type] => session_type

  if session_type.blank? ||
      (session_type == "morning" && r.params[:morning_date].blank?) ||
      (session_type == "hour" && r.params[:hour_date].blank?)
    next html -> { <<~HTML
      <form-errors>
        <p data-function="replaceChildren">Please select a suitable time for your session.</p>
      </form-errors>
    HTML
    }
  end
  if session_type == "free"
    next r.redirect("/successful")
  end

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
