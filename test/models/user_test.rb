require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @valid_user = User.new(name: "Test",
                           email: "test@email.com",
                           password: "password",
                           password_confirmation: "password",
                          )
  end

  test "should be valid" do
    assert @valid_user.valid?
  end

  test "name should be present" do
    @valid_user.name = "        "
    assert_not @valid_user.valid?
  end

  test "email should be present" do
    @valid_user.email = "        "
    assert_not @valid_user.valid?
  end

  test "password should be present" do
    @valid_user.password = "          "
    assert_not @valid_user.valid?
  end

  test "name should not be too short" do
    @valid_user.password = @valid_user.password_confirmation = "a" * 5
    assert_not @valid_user.valid?
  end

  test "email should not be too long" do
    @valid_user.email = "a" * 300 + "@email.com"
    assert_not @valid_user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @valid_user.email = valid_address
      assert @valid_user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @valid_user.email = invalid_address
      assert_not @valid_user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email address should be unique" do
    dup_user = @valid_user.dup
    @valid_user.save
    assert_not dup_user.valid?
  end

  test "email case should be downcase" do
    uppercase_email = "UPPER@EXAMPLE.COM"
    @valid_user.email = uppercase_email
    @valid_user.save
    assert_equal uppercase_email.downcase, @valid_user.email
  end
end
