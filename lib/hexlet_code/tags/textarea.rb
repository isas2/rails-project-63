# frozen_string_literal: true

module HexletCode
  module Tags
    class Textarea < BaseTag
      def initialize(attributes = {})
        super
        @tag = :textarea
        @attributes = { cols: 20, rows: 40 }.merge(@attributes)
      end
    end
  end
end
