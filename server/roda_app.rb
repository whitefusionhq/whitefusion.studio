require "mail"
require "dotenv/load" unless Bridgetown.env.production?

require_relative "../config/roda/plugins/cable_car"

Mail.defaults do
  delivery_method :smtp,
                  address: "smtp.sendgrid.net",
                  port: 465,
                  user_name: "apikey",
                  password: ENV["SENDGRID_API_KEY"],
                  authentication: :plain,
                  tls: true
end


class RodaApp < Bridgetown::Rack::Roda
  plugin :bridgetown_ssr
  plugin :bridgetown_routes

  plugin :cable_car

  # Hopefully this gets merged in upstream !!!
  CableReady::CableCar.class_eval do
    def dispatch(element: false, clear: true)
      payload = element ? operations_in_custom_element : operations_payload
      reset! if clear
      payload
    end

    def operations_in_custom_element
      %(<cable-ready><script type="application/json">#{operations_payload.to_json}</script></cable-ready>)
    end
  end

  route do |r|
    r.bridgetown
  end
end
