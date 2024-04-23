# frozen_string_literal: true

module HexletCode
  module Tags
    class Option < Tag
      def initialize(attributes = {}, &block)
        super
        @tag = :option
        @attributes = attributes.except(:type, :name)
        @body = proc { attributes[:value] }
        @checked = block
      end

      def attributes
        return @attributes if @checked.nil?

        return @attributes.merge({ checked: true }) if @attributes[:value] == @checked.call

        @attributes
      end
    end
  end
end
