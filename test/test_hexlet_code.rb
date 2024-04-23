# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, :active, :status, keyword_init: true)

  def setup
    @user1 = User.new name: 'rob', job: 'hexlet', gender: 'm'
    @user2 = User.new job: 'hexlet'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_return_unpaired_tag
    tag = HexletCode::Tags::Tag.build('br')

    assert_equal '<br>', tag

    tag = HexletCode::Tags::Tag.build('img', src: 'path/to/image')

    assert_equal load_fixture('tag_img.html'), tag

    tag = HexletCode::Tags::Tag.build('input', type: 'submit', value: 'Save')

    assert_equal load_fixture('tag_input.html'), tag
  end

  def test_return_paired_tag
    tag = HexletCode::Tags::Tag.build('label', for: 'email') { 'Email' }

    assert_equal load_fixture('tag_label.html'), tag

    tag = HexletCode::Tags::Tag.build('div') { '' }

    assert_equal '<div></div>', tag
  end

  def test_form_for_without_url
    result = HexletCode.form_for @user1

    assert_equal load_fixture('form_without_action.html'), result
  end

  def test_form_for_with_url
    result = HexletCode.form_for @user1, url: '/users'

    assert_equal load_fixture('form_with_action.html'), result
  end

  def test_form_fields_default
    result = HexletCode.form_for @user1 do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal load_fixture('form_with_defaults.html'), result
  end

  def test_form_with_fields_attributes
    result = HexletCode.form_for @user1 do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end

    assert_equal load_fixture('form_with_attrs.html'), result
  end

  def test_form_reassign_attributes
    result = HexletCode.form_for @user1 do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert_equal load_fixture('form_with_reassign_attrs.html'), result
  end

  def test_form_with_missing_method
    assert_raises NoMethodError do
      HexletCode.form_for @user1, url: '/users' do |f|
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

    assert_equal load_fixture('form_with_default_submit.html'), result
  end

  def test_form_with_submit_value
    result = HexletCode.form_for @user2, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    assert_equal load_fixture('form_with_submit.html'), result
  end

  def test_form_custom_attributes
    result = HexletCode.form_for @user1, url: '/profile', method: :get, class: 'hexlet-form', &:submit

    assert_equal load_fixture('form_with_custom_attributes.html'), result
  end

  def test_form_with_object_change
    user = User.new name: 'bill'
    form = HexletCode::Tags::Form.new(user, {}) { |f| f.input :name }
    user.name = 'tom'
    result = HexletCode::FormRender.render(form)

    assert_equal load_fixture('form_with_object_change.html'), result
  end

  def test_form_with_complex_fields
    user = User.new active: true, status: 'error'
    result = HexletCode.form_for user, url: '/users' do |f|
      f.input :gender, as: :hidden
      f.input :active, as: :checkbox
      f.input :status, as: :checkbox, values: %w[error wait ok]
      f.input :status, as: :radio, values: %w[error wait ok]
      f.input :status, as: :select, values: %w[error wait ok]
    end

    assert_equal load_fixture('form_with_complex_fields.html'), result
  end
end
