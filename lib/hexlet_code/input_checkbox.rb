# frozen_string_literal: true

module HexletCode
  module Tags
    class InputCheckbox < Input
      def initialize(attributes = {}, &)
        super
        @attributes[:type] = :checkbox
      end

      def attributes
        value = @body.call
        return @attributes.merge({ checked: true }) if @attributes[:value] == value || value == true

        @attributes
      end
    end
  end
end
