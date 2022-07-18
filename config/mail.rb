Bridgetown.initializer :mail do |password:|
  Mail.defaults do
    delivery_method :smtp,
                    address: "smtp.sendgrid.net",
                    port: 465,
                    user_name: "apikey",
                    password:,
                    authentication: :plain,
                    tls: true
  end
end
