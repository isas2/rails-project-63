# frozen_string_literal: true

module HexletCode
  module Tags
    class Form < BaseTag
      attr_reader :object

      def initialize(object, attributes = {}, &)
        super(attributes, &)
        @tag = :form
        @object = object
        @attributes = {
          **@attributes,
          x_hexletcode_nested_level: 0,
          action: attributes[:url] || '#',
          method: attributes[:method] || :post
        }
        yield(self) if block_given?
      end

      def input(name, attributes = {})
        @object.public_send(name)
        @fields << get_class(attributes).new({ name:, **attributes })
      end

      def submit(value = 'Save')
        @fields << HexletCode::Tags::InputButton.new(type: :submit, value:, label: false)
      end
    end
  end
end
