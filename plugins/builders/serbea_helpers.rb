class Builders::SerbeaHelpers < SiteBuilder
  def build
    helper :redent do |input|
      Bridgetown::Utils.reindent_for_markdown(input.to_s).html_safe
    end

    helper :content_for do |key, &block|
      resource = block.binding.receiver.resource
      resource.data[key] = block.binding.receiver.capture(&block)
    end
  end
end
