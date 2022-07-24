require "active_support/isolated_execution_state"
require "active_support/time"

require "sidekiq"
require "bridgetown"

module Bridgetown
  class SidekiqMiddleware
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

  Bridgetown::PluginManager.require_from_bundler
  config_options = Bridgetown.configuration
  config_options.run_initializers! context: :server
  Bridgetown::SidekiqMiddleware.site = Bridgetown::Site.new(config_options)

  config.server_middleware do |chain|
    chain.add Bridgetown::SidekiqMiddleware
  end
end

Sidekiq.configure_client do
  Bridgetown.initializer :"bridgetown-sidekiq" do |config, cli_options: ""|
    next unless Bridgetown.env.development? && config.using_puma

    Bridgetown::Utils::Aux.run_process "Sidekiq", :red, "sleep 4 && bundle exec sidekiq -r ./config/sidekiq.rb #{cli_options}", env: { "APP_ENV" => "development" }
  end
end
