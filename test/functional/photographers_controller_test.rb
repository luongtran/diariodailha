require 'test_helper'

class PhotographersControllerTest < ActionController::TestCase
  test "should get authorize" do
    get :authorize
    assert_response :success
  end

  test "should get deny" do
    get :deny
    assert_response :success
  end

end
