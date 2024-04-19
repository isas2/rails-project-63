# frozen_string_literal: true

module HexletCode
  class FormRender
    def self.render(form)
      HexletCode::Tag.build(:form, form.attributes.except(:url)) do
        fields_html = form.fields.map { |attr| render_field(attr) }
        "\n#{fields_html.join("\n")}\n" unless fields_html.empty?
      end
    end

    def self.render_field(attrs)
      attrs = { cols: 20, rows: 40 }.merge(attrs.merge({ tag: :textarea }).except(:type)) if attrs[:as] == :text
      "  #{HexletCode::Tag.build(attrs.fetch(:tag), attrs.except(:tag, :as))}"
    end
  end
end
