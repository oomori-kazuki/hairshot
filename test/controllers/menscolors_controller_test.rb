require 'test_helper'

class MenscolorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get menscolors_index_url
    assert_response :success
  end

end
