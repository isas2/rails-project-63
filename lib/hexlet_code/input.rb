# frozen_string_literal: true

module HexletCode
  module Tags
    class Input < Tag
      def initialize(attributes = {}, &)
        super
        @tag = :input
      end

      def attributes
        # значение value получаем на момент рендеринга
        @body.nil? ? @attributes : @attributes.merge({ value: @body.call })
      end
    end
  end
end
