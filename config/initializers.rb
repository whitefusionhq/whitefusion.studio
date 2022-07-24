Bridgetown.configure do
  init :dotenv
  init :"bridgetown-routes"
  init :"roda-turbo"

  permalink "pretty"
  timezone "America/Los_Angeles"

  init :stripe, api_key: ENV["STRIPE_API_KEY"]

  only :server do
    init :parse_routes, require_gem: false

    init :mail do
      password  ENV["SENDGRID_API_KEY"]
    end
  end

  init :sidekiq

  only :static do
    init :"bridgetown-sidekiq", require_gem: false
  end

  only :static, :console do
    puts "static and console!"
  end

  only :rake do
    puts "I'm in a Rake context!"
  end

  # init :"bridgetown-activerecord"
end

Bridgetown.initializer :stripe do |api_key:|
  Stripe.api_key = api_key
end
