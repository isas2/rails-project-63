# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/label'
require_relative 'hexlet_code/form'
require_relative 'hexlet_code/input'
require_relative 'hexlet_code/input_text'
require_relative 'hexlet_code/input_button'
require_relative 'hexlet_code/input_hidden'
require_relative 'hexlet_code/input_checkbox'
require_relative 'hexlet_code/input_radio'
require_relative 'hexlet_code/option'
require_relative 'hexlet_code/group'
require_relative 'hexlet_code/group_select'
require_relative 'hexlet_code/group_radio'
require_relative 'hexlet_code/group_checkbox'
require_relative 'hexlet_code/textarea'
require_relative 'hexlet_code/form_render'

module HexletCode
  def self.form_for(object, attributes = {}, &)
    form = HexletCode::Tags::Form.new(object, attributes, &)
    FormRender.render(form)
  end
end
