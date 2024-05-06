source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "bridgetown", "~> 1.3", github: "bridgetownrb/bridgetown", branch: "main"
gem "bridgetown-routes", "~> 1.3", github: "bridgetownrb/bridgetown", branch: "main"

gem "puma", "~> 6.4"

gem "dotenv", "~> 3.1"
gem "rubocop-bridgetown", "~> 0.4"
gem "solargraph", "~> 0.50"

gem "authtown", "~> 0.4"
gem "bridgetown_sequel", "~> 1.1"
gem "ice_cube", "~> 0.16"
gem "lifeform", "~> 0.14"
gem "mail", "= 2.8"
gem "pg", "~> 1.5"
gem "stripe", "~> 10.3"


group :test, optional: true do
  gem "nokogiri"
  gem "minitest"
  gem "minitest-profile"
  gem "minitest-reporters"
  gem "shoulda"
  gem "rack-test" # needed for Roda
end
