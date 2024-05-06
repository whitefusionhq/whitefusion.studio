class RodaApp < Roda
  plugin :bridgetown_server
  plugin :invocably

  route(&:bridgetown)
end
