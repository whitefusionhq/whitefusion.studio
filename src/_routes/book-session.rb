r.post do 
  r.params[:session_type] => session_type

  next r.redirect("/advance/book/") if r.params[:morning_date].blank? && r.params[:hour_date].blank?

  (session_type == "morning" ? r.params[:morning_date] : r.params[:hour_date]).then do
    Time.parse(_1).to_datetime.strftime("%A, %B %-d, %Y @ %I:%M %p")
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
        selected_date:
      }
    },
    mode: "payment",
    success_url: absolute_url("/advance/success/"),
    cancel_url: absolute_url("/advance/cancel/"),
  } => payload

  session = Stripe::Checkout::Session.create(payload)

  response.status = 303
  r.redirect session.url
end
