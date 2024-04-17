# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :object, :url, :fields, :attributes

    def initialize(object, attributes = {})
      @object = object
      url = attributes.delete(:url) || '#'
      attributes[:method] ||= :post
      @attributes = { action: url, **attributes }
      @fields = []
    end

    def input(name, attributes = {})
      value = object.public_send(name) || ''
      type = attributes.delete(:as) || 'text'
      fields << { tag: :label, tag_type: :paired, for: name, value: name.capitalize } unless type == :hidden
      if type == :text
        attributes.merge!({ cols: 20, rows: 40 }) { |_, item, _| item }
        fields << { tag: :textarea, tag_type: :paired, name:, value:, **attributes }
      else
        fields << { tag: :input, name:, type:, value:, **attributes }
      end
    end

    def submit(value = 'Save')
      fields << { tag: :input, type: :submit, value: }
    end

    def to_s
      HexletCode::Tag.build('form', attributes) do
        fields_html = fields.map { |attrs| "  #{field_to_s(attrs)}" }
        "\n#{fields_html.join("\n")}\n" unless fields_html.empty?    
      end
    end

    private

    def field_to_s(attrs)
      if attrs.delete(:tag_type) == :paired
        value = attrs.delete(:value)
        HexletCode::Tag.build(attrs.delete(:tag), attrs) { value }
      else
        HexletCode::Tag.build(attrs.delete(:tag), attrs)
      end
    end
  end
end
