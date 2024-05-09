# frozen_string_literal: true

module HexletCode
  module Tags
    class Label < BaseTag
      def initialize(attributes = {})
        super
        @tag = :label
      end
    end
  end
end
