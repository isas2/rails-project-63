# frozen_string_literal: true

module HexletCode
  module Tags
    class Option < InputCheckbox
      def initialize(attributes = {})
        super
        @tag = :option
        attrs = {
          label: false,
          x_hexletcode_selected: :selected
        }
        @attributes = @attributes.except(:type, :name, :id).merge(attrs)
      end
    end
  end
end
