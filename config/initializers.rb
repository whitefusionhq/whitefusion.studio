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
    unless Bridgetown.env.production?
      init :bridgetown_sequel do
        connection_options do
          driver_options { gssencmode "disable" } if RUBY_PLATFORM.include?("darwin")
        end
      end
    end
  end

  init :lifeform
  # Don't roll out to production yet!
  unless Bridgetown.env.production?
    init :authtown do
      user_name_field :name

      rodauth_config -> do
        enable :http_basic_auth if Bridgetown.env.test?
      end
    end
  end

  only :server do
    init :parse_routes

    init :mail do
      password ENV.fetch("SENDGRID_API_KEY", nil)
    end

    roda do |app|
      app.plugin :cookies, secure: true
    end
  end
end

Bridgetown.initializer :ice_cube do
  require "active_support/time"
end
