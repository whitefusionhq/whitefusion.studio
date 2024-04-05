# module CheckStreamlined
#   def self.===(other)
#     other.is_a?(Proc) && other.touched
#   end
# end

Bridgetown.configure do |_config|
  permalink "pretty"
  timezone "America/Los_Angeles"

  init :dotenv
  init :"bridgetown-routes"

  init :"roda-turbo"
  init :ice_cube
  init :stripe, api_key: ENV.fetch("STRIPE_API_KEY", nil)

  only :server do
    init :parse_routes

    init :mail do
      password ENV.fetch("SENDGRID_API_KEY", nil)
    end

    roda do |app|
      # TODO: we should move all this into core!

      # app.include Streamlined::Helpers
      # app.plugin :custom_block_results
      # app.handle_block_result CheckStreamlined do |callback| # rubocop:disable Style/SymbolProc
      #   callback.to_s
      # end
    end
  end
end

Bridgetown.initializer :ice_cube do
  require "active_support/time"
end
