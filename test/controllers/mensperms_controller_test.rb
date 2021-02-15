require 'test_helper'

class MenspermsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mensperms_index_url
    assert_response :success
  end

end
