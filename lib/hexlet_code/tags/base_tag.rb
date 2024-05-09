# frozen_string_literal: true

module HexletCode
  module Tags
    class BaseTag
      attr_reader :tag, :attributes, :fields, :body

      def initialize(attributes = {}, &block)
        @attributes = {
          x_hexletcode_show_value: false,
          x_hexletcode_nested_level: 1,
          **attributes
        }
        @fields = []
        @body = block
      end

      def special_attributes(value)
        { value: }
      end

      protected

      def get_class(attributes)
        return Textarea if attributes[:as] == :text

        prefix = attributes[:collection].is_a?(Array) ? 'Group' : 'Input'
        HexletCode::Tags.const_get "#{prefix}#{attributes.fetch(:as, :text).capitalize}"
      end

      def tag_id
        "var_#{@attributes[:name]}_#{@attributes[:value]}"
      end
    end
  end
end
