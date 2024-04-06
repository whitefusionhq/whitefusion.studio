Bridgetown.configure do |_config|
  permalink "pretty"
  timezone "America/Los_Angeles"

  init :dotenv
  init :"bridgetown-routes"

  init :"roda-turbo" # TODO: remove in favor of Swup & Simpatico
  init :ice_cube
  init :stripe, api_key: ENV.fetch("STRIPE_API_KEY", nil)

  only :server do
    init :parse_routes

    init :mail do
      password ENV.fetch("SENDGRID_API_KEY", nil)
    end

    roda do |app|
      app.opts[:invocably_content_type] = "text/vnd.invocably.html"
      Roda::RodaRequest.include(Module.new do
        def invocably?
          (env["HTTP_ACCEPT"] || []).include?(roda_class.opts[:invocably_content_type])
        end

        def respond_invocably
          response["Content-Type"] = roda_class.opts[:invocably_content_type]
          yield
        end
      end)
    end
  end
end

Bridgetown.initializer :ice_cube do
  require "active_support/time"
end
