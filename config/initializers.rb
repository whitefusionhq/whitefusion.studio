Bridgetown.configure do |config|
  permalink "pretty"
  timezone "America/Los_Angeles"

  init :dotenv
  init :ssr
  init :"bridgetown-routes"

  init :"roda-turbo"
  init :ice_cube
  init :stripe, api_key: ENV["STRIPE_API_KEY"]

  only :server do
    roda do |app|
      # TODO:
      # app.plugin :sessions,
      #   secret: ENV.fetch("RODA_SECRET_KEY", nil),
      #   parser: ->(data) { JSON.parse(data).with_indifferent_access }
    end

    init :parse_routes

    init :mail do
      password ENV["SENDGRID_API_KEY"]
    end
  end
end

Bridgetown.initializer :ice_cube do
  require "active_support/time"
end
