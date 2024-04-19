# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :fields, :attributes

    def initialize(object, attributes = {})
      @object = object
      attributes[:method] ||= :post
      @attributes = { action: attributes.fetch(:url, '#'), **attributes }
      @fields = []
    end

    def input(name, attributes = {})
      value = @object.public_send(name) || ''
      type = attributes.fetch(:as, :text)
      fields << { tag: :input, name:, type:, value:, **attributes }
    end

    def submit(value = 'Save')
      fields << { tag: :input, type: :submit, label: false, value: }
    end
  end
end
