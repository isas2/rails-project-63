# frozen_string_literal: true

module HexletCode
  module Tags
    class GroupSelect < Group
      def initialize(attributes = {})
        super
        @tag = :select
      end

      def build_fields
        klass = HexletCode::Tags::Option
        @attributes[:collection].map do |value, label|
          klass.new({ **@attributes, value:, x_hexletcode_nested_level: 2 }) { label }
        end
      end
    end
  end
end
