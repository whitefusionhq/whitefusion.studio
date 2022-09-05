require_relative "../lib/bridgetown-sidekiq"
require "sidekiq-cron"

Sidekiq.configure_client do
  # add any setup configuration here for Sidekiq clients
end

Sidekiq.configure_server do
  # add any setup configuration here for the Sidekiq server
end
