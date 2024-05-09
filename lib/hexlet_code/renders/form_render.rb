# frozen_string_literal: true

module HexletCode
  class FormRender
    class << self
      def render(form)
        HexletCode::Tag.build(:form, form.attributes) do
          render_nested_tags(form) { |f| field_value(form.object, f) }.call
        end
      end

      private

      def field_value(object, field)
        name = field.attributes[:name]
        value = object.public_send(name) unless name.nil?
        value.nil? ? field.attributes[:value] : value
      end

      def render_tag(field, value)
        attrs = field.attributes.merge(field.special_attributes(value))
        body = field.fields.any? ? render_nested_tags(field) { value } : field.body
        field_html = "#{spaces(field)}#{HexletCode::Tag.build(field.tag, attrs, &body)}"
        label_html = render_label(field)
        return field_html if label_html.nil?

        fields = attrs[:x_hexletcode_label_pos] == :after ? [field_html, label_html] : [label_html, field_html]
        fields.join("\n")
      end

      def render_label(field)
        return if field.attributes[:label] == false

        name = field.attributes[:name]
        label_for = field.attributes[:id] || name
        label_text = field.attributes[:x_hexletcode_label_text] || name.capitalize
        "#{spaces(field)}#{HexletCode::Tag.build(:label, { for: label_for }) { label_text }}"
      end

      def spaces(field)
        ' ' * 2 * field.attributes[:x_hexletcode_nested_level]
      end

      def render_nested_tags(field, &block)
        proc do
          fields_html = field.fields.map { |f| render_tag(f, block.call(f)) }
          "\n#{fields_html.join("\n")}\n#{spaces(field)}" unless fields_html.empty?
        end
      end
    end
  end
end
