module CheckStreamlined
  def self.===(other)
    other.is_a?(Proc) && other.touched
  end
end

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

    roda do |app|
      # TODO: we should move all this into core!

      app.include Streamlined::Helpers
      app.plugin :custom_block_results
      app.handle_block_result CheckStreamlined do |callback|
        callback.to_s
      end
    end
  end
end

Bridgetown.initializer :ice_cube do
  require "active_support/time"
end
