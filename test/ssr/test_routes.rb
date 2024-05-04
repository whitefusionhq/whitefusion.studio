require_relative "ssr_helper"

class TestRoutes < SSRTest
  context "contact" do
    should "reset" do
      post "/contact-form/reset"

      assert_equal "Booyeah!", query("sl-button").content.strip
    end
  end
end
