require "dotenv/load" unless Bridgetown.env.production?

require_relative "../config/initializers/mail"

class RodaApp < Bridgetown::Rack::Roda
  plugin :bridgetown_ssr
  plugin :bridgetown_routes

  plugin :turbo

  route do |r|
    r.bridgetown
  end
end
