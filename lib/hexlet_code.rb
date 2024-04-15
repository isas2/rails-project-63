# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  autoload(:Tag, "hexlet_code/tag")

  # rubocop:disable Lint/UnusedMethodArgument
  def self.form_for(object, attributes = {}, &block)
    form_open = "<form action=\"#{attributes.fetch(:url, "#")}\" method=\"post\">"
    block_body = block_given? ? block.call : ""
    "#{form_open}#{block_body}</form>"
  end
  # rubocop:enable Lint/UnusedMethodArgument
end
