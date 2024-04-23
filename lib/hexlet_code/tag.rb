# frozen_string_literal: true

module HexletCode
  module Tags
    class Tag
      UNPAIRED = %i[area base basefont bgsound br col command embed hr img input keygen
                    link meta param source track wbr].freeze

      attr_reader :attributes

      def initialize(attributes = {}, &block)
        @attributes = attributes
        @body = block
      end

      def self.build(tag_name, attributes = {}, &block)
        if UNPAIRED.include?(tag_name.to_sym)
          "<#{tag_name}#{join_attributes(attributes)}>"
        else
          body_html = block.call if block_given?
          "<#{tag_name}#{join_attributes(attributes)}>#{body_html}</#{tag_name}>"
        end
      end

      def self.join_attributes(attributes)
        attributes.to_a.map { |k, v| k == :checked ? " #{k}" : " #{k}=\"#{v}\"" }.join
      end

      def render
        get_fields_html = proc do
          fields_html = @fields.map(&:render)
          "\n    #{fields_html.join("\n    ")}\n  " unless fields_html.empty?
        end
        body = @fields.is_a?(Array) ? get_fields_html : @body
        Tag.build(@tag, attributes.except(:label, :as, :url), &body)
      end

      protected

      def get_class(attributes, prefix = 'Input')
        HexletCode::Tags.const_get "#{prefix}#{attributes.fetch(:as, :text).capitalize}"
      end
    end
  end
end
