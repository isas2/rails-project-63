# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:Form, 'hexlet_code/form')
  autoload(:FormRender, 'hexlet_code/form_render')

  def self.form_for(object, attributes = {})
    form = Form.new(object, attributes)
    yield(form) if block_given?
    FormRender.render(form)
  end
end
