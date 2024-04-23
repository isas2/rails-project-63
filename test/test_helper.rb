# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'hexlet_code'
require 'hexlet_code/tag'
require 'hexlet_code/label'
require 'hexlet_code/form'
require 'hexlet_code/input'
require 'hexlet_code/input_text'
require 'hexlet_code/input_button'
require 'hexlet_code/input_hidden'
require 'hexlet_code/input_checkbox'
require 'hexlet_code/input_radio'
require 'hexlet_code/option'
require 'hexlet_code/group'
require 'hexlet_code/group_select'
require 'hexlet_code/group_radio'
require 'hexlet_code/group_checkbox'
require 'hexlet_code/textarea'
require 'hexlet_code/form_render'

require 'minitest/autorun'

def load_fixture(filename)
  File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
end
