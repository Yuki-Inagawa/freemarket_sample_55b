require 'test_helper'

class JinnoControllerTest < ActionDispatch::IntegrationTest
  test "should get footer" do
    get jinno_footer_url
    assert_response :success
  end

end
