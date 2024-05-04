require_relative "helper"

class TestHomepage < Minitest::Test
  context "homepage" do
    document do
      site.collections.pages.find { |doc| doc.relative_url == "/" }
    end

    should "exist" do
      assert query("body")

      assert_equal "/images/whitefusion-w-transparent.png", query_all("img").last[:src]
    end
  end

  context "404" do
    document do
      site.collections.pages.find { |doc| doc.relative_url == "/404" }
    end

    should "exist" do
      assert query("body")

      assert_equal "404", query("h1").content
    end
  end
end
