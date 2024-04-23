# frozen_string_literal: true

module HexletCode
  module Tags
    class InputButton < Input
      def initialize(attributes = {}, &)
        super
        @attributes[:label] = false
      end
    end
  end
end
