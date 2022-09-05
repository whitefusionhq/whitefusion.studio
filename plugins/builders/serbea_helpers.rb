class Builders::SerbeaHelpers < SiteBuilder
  def build
    helper :redent do |input|
      Bridgetown::Utils.reindent_for_markdown(input.to_s).html_safe
    end

    helper :content_for
  end

  def content_for(key, &block)
    view = helpers.view
    view.resource.data[key] = view.capture(&block)
  end
end
