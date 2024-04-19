# frozen_string_literal: true

module HexletCode
  class Tag
    @unpaired = %i[area base basefont bgsound br col command embed hr img input keygen link meta param source track wbr]

    def self.build(tag_name, attributes = {}, &block)
      label = get_tag_label(tag_name, attributes)
      if @unpaired.include?(tag_name.to_sym)
        "#{label}<#{tag_name}#{join_attributes(attributes.except(:label))}>"
      else
        value = block_given? ? block.call : attributes.fetch(:value)
        "#{label}<#{tag_name}#{join_attributes(attributes.except(:value))}>#{value}</#{tag_name}>"
      end
    end

    def self.join_attributes(attributes)
      attributes.to_a.map { |k, v| " #{k}=\"#{v}\"" }.join
    end

    def self.get_tag_label(tag_name, attributes)
      return unless %i[input textarea].include?(tag_name) && attributes[:label] != false

      name = attributes[:name]
      "#{build(:label, { for: name, value: name.capitalize })}\n  "
    end
  end
end
