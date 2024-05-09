# frozen_string_literal: true

module HexletCode
  module Tags
    class InputCheckbox < Input
      def initialize(attributes = {})
        super
        attrs = {
          type: :checkbox,
          id: tag_id,
          x_hexletcode_show_value: true,
          x_hexletcode_label_pos: :after,
          x_hexletcode_selected: :checked
        }
        @attributes.merge!(attrs)
      end

      def special_attributes(value)
        @attributes[:value] == value ? { @attributes[:x_hexletcode_selected] => true } : {}
      end
    end
  end
end
