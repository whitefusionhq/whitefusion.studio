require "rack"
require "rack/test"
require "bridgetown"
require "bridgetown-builder"
Bridgetown::Builders::PluginBuilder # weird autoload

require_relative "../helper"

Bridgetown.begin!
require "bridgetown-core/utils/initializers" # NOTE: not sure why I have to do this manually

class SSRTest < Minitest::Test
  include Rack::Test::Methods

  def app
    @@ssr_app ||= begin # rubocop:disable Style/ClassVars
      ENV["RACK_ENV"] = ENV["BRIDGETOWN_ENV"] = "test"
      Bridgetown::Current.preloaded_configuration = Bridgetown.configuration
      Rack::Builder.parse_file(File.expand_path("../../config.ru", __dir__))
    end
  end

  def site
    app.opts[:bridgetown_site]
  end

  def document
    @document_response = nil if @document_response != last_response

    @document_response ||= begin
      self.document = last_response.body
      last_response
    end

    @document
  end

  attr_reader :user

  def authorize_user
    authorize "test@example.com", "Abc12345"
  end

  def create_user
    app # ensure it's booted

    User.find(email: "test@example.com")&.tap do |u|
      Bridgetown.db[:account_remember_keys].where(id: u.id).delete
      Bridgetown.db[:appointments].where(user_id: u.id).delete
      u.destroy
    end

    @user = User.create(
      email: "test@example.com", password_hash: User.password_for_string("Abc12345")
    )
  end
end
