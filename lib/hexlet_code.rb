# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, "#{__dir__}/hexlet_code/tag")
  autoload(:Label, "#{__dir__}/hexlet_code/label")
  autoload(:Form, "#{__dir__}/hexlet_code/form")
  autoload(:Input, "#{__dir__}/hexlet_code/input")
  autoload(:InputText, "#{__dir__}/hexlet_code/input_text")
  autoload(:InputButton, "#{__dir__}/hexlet_code/input_button")
  autoload(:InputHidden, "#{__dir__}/hexlet_code/input_hidden")
  autoload(:InputCheckbox, "#{__dir__}/hexlet_code/input_checkbox")
  autoload(:InputRadio, "#{__dir__}/hexlet_code/input_radio")
  autoload(:Option, "#{__dir__}/hexlet_code/option")
  autoload(:Group, "#{__dir__}/hexlet_code/igroup")
  autoload(:GroupSelect, "#{__dir__}/hexlet_code/group_select")
  autoload(:GroupRadio, "#{__dir__}/hexlet_code/group_radio")
  autoload(:GroupCheckbox, "#{__dir__}/hexlet_code/group_checkbox")
  autoload(:Textarea, "#{__dir__}/hexlet_code/textarea")
  autoload(:FormRender, "#{__dir__}/hexlet_code/form_render")

  def self.form_for(object, attributes = {}, &)
    form = Tags::Form.new(object, attributes, &)
    FormRender.render(form)
  end
end
