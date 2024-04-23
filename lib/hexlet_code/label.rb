# frozen_string_literal: true

module HexletCode
  module Tags
    class Label < Tag
      def initialize(name)
        super
        @tag = :label
        @attributes = { for: name }
        @body = proc { name.capitalize }
      end
    end
  end
end
