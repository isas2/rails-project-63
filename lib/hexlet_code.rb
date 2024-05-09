# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tags, 'hexlet_code/tags')
  autoload(:Tag, 'hexlet_code/renders/tag')
  autoload(:FormRender, 'hexlet_code/renders/form_render')

  def self.form_for(object, attributes = {}, &)
    form = Tags::Form.new(object, attributes, &)
    FormRender.render(form)
  end
end

# User = Struct.new(:name, :job, :gender, :active, :status, keyword_init: true)
# user = User.new name: 'rob', job: 'hexlet', gender: 'm'
# form = HexletCode.form_for user do |f|
#   f.input :name
#   f.input :job, as: :text
# end
# puts form
