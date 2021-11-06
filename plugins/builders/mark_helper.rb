class Builders::MarkHelper < SiteBuilder
  def build
    liquid_tag "mark", :mark, as_block: true
  end

  def mark(attributes, tag)
    %(<mark markdown="span">#{tag.content}</mark>)
  end
end
