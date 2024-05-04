require "nokogiri"
require "minitest/autorun"
require "minitest/reporters"
require "minitest/profile"
require "shoulda"

unless Nokogiri::XML::Node <= Bridgetown::Builders::DSL::Inspectors::QuerySelection
  Nokogiri::XML::Node.include Bridgetown::Builders::DSL::Inspectors::QuerySelection
end

# Report with color.
Minitest::Reporters.use! [
  Minitest::Reporters::DefaultReporter.new(
    color: true
  ),
]

Shoulda::Context::Context.class_eval do
  def document(&block)
    setup do
      self.document = instance_exec(&block)
    end
  end
end

Minitest::Test.class_eval do
  def site
    @site ||= Bridgetown::Current.site
  end

  attr_reader :document

  def document=(resource)
    resource = resource.output if resource.respond_to?(:output)

    raise "Document appears to be missing" if resource.nil?

    @document = Nokogiri::HTML5(resource)
  end

  def query(selector) = document.query_selector(selector)

  def query_all(selector) = document.query_selector_all(selector)
end
