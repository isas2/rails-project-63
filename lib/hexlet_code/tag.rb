# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(tag_name, attributes = {}, &block)
      attrs = attributes.to_a.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
      tag = attrs.empty? ? "<#{tag_name}>" : "<#{tag_name} #{attrs}>"
      tag += "#{block.call}</#{tag_name}>" if block_given?
      tag
    end
  end
end
