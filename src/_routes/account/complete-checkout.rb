def mail_booking_notice(name, email, selected_date, session_type)
  Mail.deliver do
    to      "Jared White <jared@whitefusion.studio>"
    from    "Jared White <jared@whitefusion.studio>"
    subject "Whitefusion Notice: New Booking"

    text_part do
      body <<~TEXT
        There's been a new booking for #{name} <#{email}>.

        Date: #{selected_date}
        Type: #{session_type}
      TEXT
    end
  end
end

# route: /account/complete-checkout/
r.get do
  r.params[:session_id] => session_id

  Stripe::Checkout::Session.retrieve(id: session_id, expand: ["setup_intent"]) => stripe_session
  stripe_session.customer_details.to_h => email:, name:
  stripe_session.setup_intent.metadata.to_h => selected_date:, session_type:

  Stripe::Customer.create(name:, email:, metadata: {
    selected_date:, session_type:,
  }) => customer

  Stripe::PaymentMethod.attach(
    stripe_session.setup_intent.payment_method, { customer: customer.id }
  )

  mail_booking_notice name, email, selected_date, session_type

  one_hour = Time.now + (60 * 60)
  response.set_cookie :stripe_customer_id, value: customer.id, expires: one_hour
  response.set_cookie :submitted_date, value: selected_date, expires: one_hour
  response.set_cookie :session_type, value: session_type, expires: one_hour

  redirect_url = rodauth.logged_in? ? "/account/profile" : "/auth/create-account"
  r.redirect(redirect_url)
end
