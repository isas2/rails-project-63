# frozen_string_literal: true

module HexletCode
  module Tags
    class InputText < Input
      def initialize(attributes = {})
        super
        @attributes[:type] = :text
      end
    end
  end
end
