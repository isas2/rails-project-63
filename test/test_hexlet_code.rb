# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_return_unpaired_tag
    tag = HexletCode::Tag.build("br")

    assert_equal "<br>", tag

    tag = HexletCode::Tag.build("img", src: "path/to/image")

    assert_equal "<img src=\"path/to/image\">", tag

    tag = HexletCode::Tag.build("input", type: "submit", value: "Save")

    assert_equal "<input type=\"submit\" value=\"Save\">", tag
  end

  def test_return_paired_tag
    tag = HexletCode::Tag.build("label") { "Email" }

    assert_equal "<label>Email</label>", tag

    tag = HexletCode::Tag.build("label", for: "email") { "Email" }

    assert_equal "<label for=\"email\">Email</label>", tag

    tag = HexletCode::Tag.build("div") { "" }

    assert_equal "<div></div>", tag
  end

  def test_return_form
    user = User.new name: "rob"
    form = HexletCode.form_for(user) { |_| "" }

    assert_equal "<form action=\"#\" method=\"post\"></form>", form

    form = HexletCode.form_for(user, url: "/users")

    assert_equal "<form action=\"/users\" method=\"post\"></form>", form
  end
end
