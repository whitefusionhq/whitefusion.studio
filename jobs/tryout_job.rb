class TryoutJob
  include Sidekiq::Job
  sidekiq_options queue: "wowee"

  def perform(*args)
    puts "Wow man! #{bridgetown_site.collections.posts} #{args}"
  end
end
