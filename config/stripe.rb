Bridgetown.initializer :stripe do |api_key:|
  Bridgetown.logger.info "Stripe:", "Setting the API key"
  Stripe.api_key = api_key
end
