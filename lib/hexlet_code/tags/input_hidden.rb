# frozen_string_literal: true

module HexletCode
  module Tags
    class InputHidden < Input
      def initialize(attributes = {})
        super
        attrs = {
          type: :hidden,
          label: false,
          x_hexletcode_show_value: true
        }
        @attributes.merge!(attrs)
      end
    end
  end
end
