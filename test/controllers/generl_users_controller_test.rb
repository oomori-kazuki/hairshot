require 'test_helper'

class GenerlUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get generl_users_show_url
    assert_response :success
  end

  test "should get new" do
    get generl_users_new_url
    assert_response :success
  end

  test "should get create" do
    get generl_users_create_url
    assert_response :success
  end

  test "should get edit" do
    get generl_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get generl_users_update_url
    assert_response :success
  end

  test "should get destroy" do
    get generl_users_destroy_url
    assert_response :success
  end

end
