# frozen_string_literal: true

class Builders::Datauri < SiteBuilder
  def build
    liquid_tag "datauri", :datauri
    helper "datauri", :datauri
  end

  def datauri(image_path, tag=nil)
    full_path = site.in_source_dir("images", image_path.strip)
    data = File.read(full_path)
    encoded_data = Base64.strict_encode64(data)
    "data:image/png;base64,#{encoded_data}"
  end
end
