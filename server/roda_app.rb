class RodaApp < Roda
  plugin :bridgetown_server
  route(&:bridgetown)
end
