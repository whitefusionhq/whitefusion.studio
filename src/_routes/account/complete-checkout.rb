# route: /account/complete-checkout/
r.get do
  r.params[:session_id] => session_id
  if session_id.to_s == ""
    # TODO: I don't know why this isn't working
    flash.error = "Missing session ID"
    next r.redirect("/account/profile")
  end

  Stripe::Checkout::Session.retrieve(id: session_id, expand: ["setup_intent"]) => stripe_session
  stripe_session.customer_details.to_h => email:, name:
  stripe_session.setup_intent.metadata.to_h => selected_date:, session_type:

  Stripe::Customer.create(name:, email:, metadata: {
    selected_date:, session_type:,
  }) => customer

  Stripe::PaymentMethod.attach(
    stripe_session.setup_intent.payment_method, { customer: customer.id }
  )

  one_hour = Time.now + (60 * 60)
  response.set_cookie :stripe_customer_id, value: customer.id, expires: one_hour
  response.set_cookie :submitted_date, value: selected_date, expires: one_hour
  response.set_cookie :session_type, value: session_type, expires: one_hour

  redirect_url = rodauth.logged_in? ? "/account/profile" : "/auth/create-account"
  r.redirect(redirect_url)
end
