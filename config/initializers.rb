Bridgetown.configure do |config|
  init :dotenv

  config.autoload_paths << "jobs"

  init :ssr do
    setup -> site do
      puts "This is my #{site}"
    end
  end
  init :"bridgetown-routes"
  init :"roda-turbo"

  permalink "pretty"
  timezone "America/Los_Angeles"

  # reflect :stripe
  init :stripe, api_key: ENV["STRIPE_API_KEY"]

  only :server do
    init :parse_routes

    init :mail do
      password ENV["SENDGRID_API_KEY"]
    end
  end

  init :sidekiq, dev_cli_options: "-v"

  only :static, :console do
    puts "static and console!"
  end

  only :rake do
    puts "I'm in a Rake context!"
  end

  except :static, :console do
    hook :site, :after_init do |site|
      puts "Hello, I'm a #{site}! Thread #{Thread.current.native_thread_id}"
    end
  end

  # init :"bridgetown-activerecord"
end

Bridgetown.initializer :stripe do |api_key:|
  Stripe.api_key = api_key
end
