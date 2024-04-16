# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :object, :url, :fields

    def initialize(object, attributes = {})
      @object = object
      @attributes = attributes
      @url = attributes.fetch(:url, "#")
      @fields = {}
    end

    def input(name, attributes = {})
      object.public_send(name)
      fields[name] = attributes
    end

    def to_s
      HexletCode::Tag.build("form", { action: url, method: "post" }) do
        fields_html = fields.map { |name, attrs| field_to_s(name, attrs) }
        "\n#{fields_html.map { |t| "  #{t}" }.join("\n")}\n" unless fields_html.empty?
      end
    end

    private

    def field_to_s(name, attrs)
      value = object.public_send(name) || ""
      case attrs.delete(:as)
      when :text
        attrs.merge!({ cols: 20, rows: 40 }) { |_, item, _| item }
        HexletCode::Tag.build("textarea", { name: name, **attrs }) { value }
      else
        attrs[:value] = value unless value.empty?
        HexletCode::Tag.build("input", { name: name, type: "text", **attrs })
      end
    end
  end
end
