require_relative "ssr_helper"

class TestLogin < SSRTest
  context "authentication" do
    should "return the login page" do
      get "/auth/login"
      assert last_response.ok?

      assert_equal "Access Your Account", query("h1").content
    end
  end
end
