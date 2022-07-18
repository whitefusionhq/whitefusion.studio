class RodaApp < Bridgetown::Rack::Roda
  plugin :bridgetown_ssr
  plugin :bridgetown_routes

  plugin :turbo

  route do |r|
    r.bridgetown
  end
end
