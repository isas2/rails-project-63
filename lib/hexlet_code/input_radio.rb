# frozen_string_literal: true

module HexletCode
  module Tags
    class InputRadio < InputCheckbox
      def initialize(attributes = {}, &)
        super
        @attributes[:type] = :radio
      end
    end
  end
end
