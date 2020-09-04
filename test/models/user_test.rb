require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @valid_user = User.new(name: "Test", email: "test@email.com")
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

  test "name should not be too long" do
    @valid_user.name = "a" * 51
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
end
