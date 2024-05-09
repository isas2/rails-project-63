# frozen_string_literal: true

module HexletCode
  module Tags
    class InputButton < Input
      def initialize(attributes = {})
        super
        @attributes[:label] = false
        @attributes[:x_hexletcode_show_value] = true
      end
    end
  end
end
