# frozen_string_literal: true

require 'bundler'
require 'hexlet_code'

Bundler.require

RSpec.configure do |config|
  config.include RSpecHtmlMatchers
end
