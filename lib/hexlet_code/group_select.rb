# frozen_string_literal: true

module HexletCode
  module Tags
    class GroupSelect < Group
      def initialize(attributes = {}, &) # rubocop:disable Lint/MissingSuper
        @tag = :select
        @attributes = attributes.except(:values)
        @klass = HexletCode::Tags::Option
        @fields = get_fields(attributes, &)
      end
    end
  end
end
