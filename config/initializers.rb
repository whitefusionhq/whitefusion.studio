Bridgetown.configure do |config|
  permalink "pretty"
  timezone "America/Los_Angeles"

  init :dotenv
  init :"bridgetown-routes"

  init :"roda-turbo"
  init :ice_cube
  init :stripe, api_key: ENV["STRIPE_API_KEY"]

  only :server do
    init :parse_routes

    init :mail do
      password ENV["SENDGRID_API_KEY"]
    end
  end
end

Bridgetown.initializer :ice_cube do
  require "active_support/time"
end
