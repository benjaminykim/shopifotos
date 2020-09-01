require 'test_helper'

class AppControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Shopifotos"
  end

  test "should get home" do
    get home_url
    assert_response :success
    assert_select "title", "#{@base_title} | Home"
  end

  test "should get profile" do
    get profile_url
    assert_response :success
    assert_select "title", "#{@base_title} | Profile"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "#{@base_title} | About"
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select "title", "#{@base_title} | Contact"
  end

end
