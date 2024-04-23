# frozen_string_literal: true

module HexletCode
  module Tags
    class Group < Tag
      def initialize(attributes = {}, &) # rubocop:disable Lint/MissingSuper
        @tag = :fieldset
        @attributes = attributes.except(:values)
        @klass = get_class(attributes)
        @fields = get_fields(attributes, &)
      end

      def get_fields(attributes, &)
        attributes[:values].map do |value|
          @klass.new({ **attributes.except(:values), value: }, &)
        end
      end
    end
  end
end
