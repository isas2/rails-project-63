# frozen_string_literal: true

module HexletCode
  module Tags
    class Group < BaseTag
      def initialize(attributes = {})
        super
        @tag = :fieldset
        @fields = build_fields
      end

      def build_fields
        klass = get_class(@attributes.except(:collection))
        @attributes[:collection].map do |value, text|
          attrs = {
            **@attributes,
            value:,
            x_hexletcode_label_text: text || value,
            x_hexletcode_nested_level: 2
          }
          klass.new(attrs)
        end
      end
    end
  end
end
