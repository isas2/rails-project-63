# frozen_string_literal: true

module HexletCode
  class Tag
    UNPAIRED = %i[area base basefont bgsound br col command embed hr img input keygen
                  link meta param source track wbr].freeze
    LONELY   = %i[checked selected multiple disabled].freeze

    class << self
      def build(tag_name, attributes = {}, &block)
        attrs = attributes.except(:collection, :label, :as, :url)
        if UNPAIRED.include?(tag_name.to_sym)
          "<#{tag_name}#{join_attributes(check_x_attributes(attrs))}>"
        else
          body_html = block.call if block_given?
          body_html ||= attrs.fetch(:value, '')
          "<#{tag_name}#{join_attributes(check_x_attributes(attrs))}>#{body_html}</#{tag_name}>"
        end
      end

      def join_attributes(attributes)
        attributes.to_a.map { |k, v| LONELY.include?(k) ? " #{k}" : " #{k}=\"#{v}\"" }.join
      end

      private

      def check_x_attributes(attributes)
        attrs = attributes[:x_hexletcode_show_value] ? attributes : attributes.except(:value)
        attrs.filter { |attr| !attr.start_with?('x_hexletcode_') }
      end
    end
  end
end
