# frozen_string_literal: true

module HexletCode
  module Tags
    class InputHidden < Input
      def initialize(attributes = {}, &)
        super
        @attributes.merge!({ type: :hidden, label: false })
      end
    end
  end
end
