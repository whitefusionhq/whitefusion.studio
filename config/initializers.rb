Bridgetown.configure do |_config|
  permalink "pretty"
  timezone "America/Los_Angeles"

  init :dotenv
  init :"bridgetown-routes"

  init :ice_cube
  init :stripe, api_key: ENV.fetch("STRIPE_API_KEY", nil)

  database_uri ENV.fetch(
    "DATABASE_URL", "postgres://localhost/whitefusion_studio_#{Bridgetown.env}"
  )

  except :sequel_tasks do
    # Don't roll out to production yet!
    if Bridgetown.env.development?
      init :bridgetown_sequel do
        connection_options do
          driver_options { gssencmode "disable" } if RUBY_PLATFORM.include?("darwin")
        end
      end
    end
  end

  init :lifeform
  # Don't roll out to production yet!
  if Bridgetown.env.development?
    init :authtown do
      user_name_field :name
    end
  end

  only :server do
    init :parse_routes

    init :mail do
      password ENV.fetch("SENDGRID_API_KEY", nil)
    end

    roda do |app|
      app.opts[:invocably_content_type] = "text/vnd.invocably.html"
      app.plugin :cookies, secure: true

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
