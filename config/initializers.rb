Bridgetown.configure do |_config|
  url "https://www.whitefusion.studio"
  permalink "pretty"
  timezone "America/Los_Angeles"

  template_engine :liquid

  init :dotenv
  init :"bridgetown-routes"

  init :ice_cube
  init :stripe, api_key: ENV.fetch("STRIPE_API_KEY", nil)

  database_uri ENV.fetch(
    "DATABASE_URL", "postgres://localhost/whitefusion_studio_#{Bridgetown.env}"
  )

  except :sequel_tasks do
    init :bridgetown_sequel do
      connection_options do
        driver_options { gssencmode "disable" } if RUBY_PLATFORM.include?("darwin")
      end
    end
  end

  init :lifeform

  init :authtown do
    user_name_field :name

    rodauth_config -> do
      email_from "Jared White <jared@whitefusion.studio>"

      reset_password_email_body do
        "Howdy! You or somebody requested a password reset for your Whitefusion account.\n" \
          "If that's legit, here's the link:\n#{reset_password_email_link}\n\n" \
          "Otherwise, you may safely ignore this message.\n\nThanks!\n–Jared @ Whitefusion"
      end

      enable :http_basic_auth if Bridgetown.env.test?
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
