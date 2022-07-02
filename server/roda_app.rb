class RodaApp < Bridgetown::Rack::Roda
  # Uncomment to use Bridgetown SSR:
  # plugin :bridgetown_ssr
  # plugin :bridgetown_routes

  route do |r|
    r.bridgetown
  end
end
