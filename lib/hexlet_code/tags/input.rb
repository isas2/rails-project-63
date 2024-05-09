# frozen_string_literal: true

module HexletCode
  module Tags
    class Input < BaseTag
      def initialize(attributes = {})
        super
        @tag = :input
        @attributes[:x_hexletcode_show_value] = true
      end
    end
  end
end
