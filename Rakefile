require "bridgetown"
Bridgetown.load_tasks

require "bridgetown_sequel"
BridgetownSequel.load_tasks

# Run rake without specifying any command to execute a deploy build by default.
task default: :deploy

#
# Standard set of tasks, which you can customize if you wish:
#
desc "Build the Bridgetown site for deployment"
task :deploy => [:clean, "frontend:build"] do
  Bridgetown::Commands::Build.start
end

desc "Build the site in a test environment"
task :test do
  ENV["BRIDGETOWN_ENV"] = "test"
  Bridgetown::Commands::Build.start
end

require "minitest/test_task"
Minitest::TestTask.create(:test_ssr) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.warning = false
  t.test_globs = ["test/ssr/**/test_*.rb"]
end

desc "Run both the static and dynamic server test suite"
task :test_ci do
  ENV["BRIDGETOWN_ENV"] = "test"
  sh "unset BRIDGETOWN_NO_BUNDLER_REQUIRE && bin/bt db:migrate"

  Rake::Task["test"].invoke
  Rake::Task["test_ssr"].invoke
end

desc "Runs the clean command"
task :clean do
  Bridgetown::Commands::Clean.start
end

namespace :frontend do
  desc "Build the frontend with esbuild for deployment"
  task :build do
    sh "yarn run esbuild"
  end

  desc "Watch the frontend with esbuild during development"
  task :dev do
    sh "yarn run esbuild-dev"
  rescue Interrupt
  end
end

task :env_keys => :environment do
  run_initializers context: :server

  puts "Mail keys:"
  puts site.config.init_params.mail
  puts "Stripe keys:"
  puts site.config.init_params.stripe
end
