require_relative "ssr_helper"

# See: https://devhints.io/rack-test
class TestRoutes < SSRTest
  context "contact" do
    should "reset" do
      post "/contact-form/reset"

      assert_equal "Booyeah!", query("sl-button").content.strip
    end
  end

  context "booking" do
    setup do
      create_user

      header "Invocably-Request", "true"
    end

    should "fail on no session type" do
      post "/booking/submit"

      assert_equal "Please select a suitable time for your session.", query("p").content
    end

    should "fail on no selected time" do
      post "/booking/submit", "session_type" => "free"

      assert_equal "Please select a suitable time for your session.", query("p").content
    end

    should "redirect to free" do
      selected_time = (Time.now + 100).to_s
      post "/booking/submit", session_type: "free", free_date: selected_time

      assert_equal "Awesome! Continuing on…", query("p").content.strip
      assert_equal "/auth/create-account", query("redirect-to")[:href]
      assert last_response.cookies["submitted_date"]
    end

    should "redirect to Stripe when logged out" do
      selected_time = (Time.now + 100).to_s
      post "/booking/submit", session_type: "morning", morning_date: selected_time

      assert_equal "Awesome! Loading Stripe Checkout…", query("p").content.strip
      assert_includes query("redirect-to")[:href], "https://checkout.stripe.com/c/pay/"
      assert last_response.cookies["submitted_date"]
    end

    should "redirect to Stripe when logged in" do
      authorize_user

      selected_time = (Time.now + 100).to_s
      post "/booking/submit", session_type: "morning", morning_date: selected_time

      assert_equal "Awesome! Loading Stripe Checkout…", query("p").content.strip
      assert_includes query("redirect-to")[:href], "https://checkout.stripe.com/c/pay/"
      assert last_response.cookies["submitted_date"]
    end

    should "not redirect to Stripe if customer ID was saved" do
      user.update(stripe_customer_id: "cus_12345")
      authorize_user

      selected_time = (Time.now + 100).to_s
      post "/booking/submit", session_type: "morning", morning_date: selected_time

      assert_equal "Awesome! Continuing on…", query("p").content.strip
      assert_equal "/account/profile", query("redirect-to")[:href]
      assert last_response.cookies["submitted_date"]


    end
  end

  context "profile" do
    should "redirect when not logged in" do
      get "/account/profile"

      assert_equal 302, last_response.status
      assert_equal "/auth/login", last_response["location"]
    end

    should "save appointment if cookies are present" do
      authorize_user
      assert_equal 0, Appointment.count

      selected_time = (Time.now + 100).to_s
      set_cookie ["submitted_date=#{selected_time}", "session_type=morning"]
      get "/account/profile"

      assert_equal 1, Appointment.count
    end
  end
end
