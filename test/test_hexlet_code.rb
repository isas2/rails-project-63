# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user1 = User.new name: "rob", job: "hexlet", gender: "m"
    @user2 = User.new job: "hexlet"
  end

  def load_fixture(filename)
    File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_return_unpaired_tag
    tag = HexletCode::Tag.build("br")

    assert_equal "<br>", tag

    tag = HexletCode::Tag.build("img", src: "path/to/image")

    assert_equal load_fixture("tag_img.html"), tag

    tag = HexletCode::Tag.build("input", type: "submit", value: "Save")

    assert_equal load_fixture("tag_input.html"), tag
  end

  def test_return_paired_tag
    tag = HexletCode::Tag.build("label", for: "email") { "Email" }

    assert_equal load_fixture("tag_label.html"), tag

    tag = HexletCode::Tag.build("div") { "" }

    assert_equal "<div></div>", tag
  end

  def test_form_for_without_url
    result = HexletCode.form_for @user1

    assert_equal load_fixture("form_without_action.html"), result
  end

  def test_form_for_with_url
    result = HexletCode.form_for @user1, url: "/users"

    assert_equal load_fixture("form_with_action.html"), result
  end

  def test_form_fields_default
    result = HexletCode.form_for @user1 do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal load_fixture("form_with_defaults.html"), result
  end

  def test_form_with_fields_attributes
    result = HexletCode.form_for @user1 do |f|
      f.input :name, class: "user-input"
      f.input :job
    end

    assert_equal load_fixture("form_with_attrs.html"), result
  end

  def test_form_reassign_attributes
    result = HexletCode.form_for @user1 do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert_equal load_fixture("form_with_reassign_attrs.html"), result
  end

  def test_form_with_missing_method
    assert_raises NoMethodError do
      HexletCode.form_for @user1, url: "/users" do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end

  def test_form_with_submit
    result = HexletCode.form_for @user2 do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal load_fixture("form_with_default_submit.html"), result
  end

  def test_form_with_submit_value
    result = HexletCode.form_for @user2, url: "#" do |f|
      f.input :name
      f.input :job
      f.submit "Wow"
    end

    assert_equal load_fixture("form_with_submit.html"), result
  end

  def test_form_custom_attributes
    result = HexletCode.form_for @user1, url: "/profile", method: :get, class: "hexlet-form", &:submit

    assert_equal load_fixture("form_with_custom_attributes.html"), result
  end
end
