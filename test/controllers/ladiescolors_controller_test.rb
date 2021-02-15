require 'test_helper'

class LadiescolorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ladiescolors_index_url
    assert_response :success
  end

end
