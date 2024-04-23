# frozen_string_literal: true

module HexletCode
  module Tags
    class Form < Tag
      attr_reader :fields, :attributes

      def initialize(object, attributes = {}, &)
        super(attributes, &)
        @tag = :form
        @object = object
        @attributes[:action] = attributes.fetch(:url, '#')
        @attributes[:method] ||= :post
        @fields = []
        yield(self) if block_given?
      end

      def input(name, attributes = {})
        @object.public_send(name)
        klass = if attributes[:as] == :text
                  HexletCode::Tags::Textarea
                elsif attributes[:values].is_a? Array
                  get_class(attributes, 'Group')
                else
                  get_class(attributes)
                end
        # хочу получать значение, актуальное на момент запуска рендера
        # test_form_with_object_change
        @fields << klass.new({ name:, **attributes }) { @object.public_send(name) }
      end

      def submit(value = 'Save')
        @fields << HexletCode::Tags::InputButton.new(type: :submit, value:, label: false)
      end
    end
  end
end
