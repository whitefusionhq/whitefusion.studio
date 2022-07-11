require "mail"

puts "howdy!"

Mail.defaults do
  delivery_method :smtp,
                  address: "smtp.sendgrid.net",
                  port: 465,
                  user_name: "apikey",
                  password: ENV["SENDGRID_API_KEY"],
                  authentication: :plain,
                  tls: true
end