source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "bridgetown", github: "bridgetownrb/bridgetown", branch: "main" # path: "/Users/jared/apps/bridgetown" #"~> 2.0.0.beta2"
gem "bridgetown-routes", github: "bridgetownrb/bridgetown", branch: "main" # path: "/Users/jared/apps/bridgetown" #"~> 2.0.0.beta2"

gem "puma", "~> 6.4"

gem "dotenv", "~> 3.1"
gem "rubocop-bridgetown", "~> 0.4"
gem "solargraph", "~> 0.50"

gem "authtown", "~> 0.5" #, path: "/Volumes/Video Production/APPS/FLOSS/authtown"
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
