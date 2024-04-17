# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  autoload(:Tag, "hexlet_code/tag")
  autoload(:Form, "hexlet_code/form")

  def self.form_for(object, attributes = {})
    form = Form.new(object, attributes)
    yield(form) if block_given?
    form.to_s
  end
end
