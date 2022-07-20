Bridgetown.configure do
  init :dotenv
  init :"roda-turbo"

  permalink "pretty"
  timezone "America/Los_Angeles"

  init :stripe, api_key: ENV["STRIPE_API_KEY"]

  only :server do
    require_relative "mail"
    init :mail do
      password  ENV["SENDGRID_API_KEY"]
    end
  end

  require_relative "sidekiq"

  only :static do
    init :sidekiq
  end

  # only :server do
    # init "bridgetown-activerecord" do
    #   adapter "postgresql"
    #   encoding "unicode"
    #   pool 5
    #   database "whitefusion_studio_#{Bridgetown.env}"
    #   url ENV['DATABASE_URL'] if Bridgetown.env.production?
    # end
  # end
end

Bridgetown.initializer :stripe do |api_key:|
  Stripe.api_key = api_key
end
