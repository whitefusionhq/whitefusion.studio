require "active_support/isolated_execution_state"
require "active_support/time"

require "sidekiq"
require "bridgetown"

module BridgetownSidekiq
  class Middleware
    class << self
      attr_accessor :site
    end

    def call(worker, msg, queue)
      begin
        Bridgetown::Current.site = self.class.site
        worker.instance_variable_set(:@site, self.class.site)
        worker.define_singleton_method :bridgetown_site do
          @site
        end
        yield
      rescue => ex
        puts ex.message
      end
    end
  end
end

Sidekiq.configure_server do |config|
  if Bridgetown.env.development?
    puts "\e[31m"
    puts Sidekiq::CLI.banner
    puts "\e[0m"
  end

  Bridgetown.begin!
  bridgetown_config = Bridgetown.configuration
  bridgetown_config.run_initializers! context: :server
  BridgetownSidekiq::Middleware.site = Bridgetown::Site.new(bridgetown_config)

  config.server_middleware do |chain|
    chain.add BridgetownSidekiq::Middleware
  end
end

Sidekiq.configure_client do
  Bridgetown.initializer :sidekiq do |config, dev_cli_options: ""|
    config.only :static do
      next unless Bridgetown.env.development? && config.using_puma

      Bridgetown::Utils::Aux.run_process "Sidekiq", :red, "sleep 4 && bundle exec sidekiq -r ./config/sidekiq.rb #{dev_cli_options}", env: { "APP_ENV" => "development" }
    end
  end
end
