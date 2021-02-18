require 'test_helper'

class GeneralSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get general_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get general_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get general_sessions_destroy_url
    assert_response :success
  end

end
