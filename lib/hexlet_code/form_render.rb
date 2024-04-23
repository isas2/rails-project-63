# frozen_string_literal: true

module HexletCode
  class FormRender
    def self.render(form)
      HexletCode::Tags::Tag.build(:form, form.attributes.except(:url)) do
        fields_html = form.fields.map { |field| render_field(field) }
        "\n#{fields_html.join("\n")}\n" unless fields_html.empty?
      end
    end

    def self.render_field(field)
      attrs = field.attributes
      label = "  #{HexletCode::Tags::Label.new(attrs[:name]).render}\n" if attrs[:label] != false
      "#{label}  #{field.render}"
    end
  end
end
