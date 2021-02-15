require 'test_helper'

class LadiespermsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ladiesperms_index_url
    assert_response :success
  end

end
