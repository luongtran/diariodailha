require 'test_helper'

class MarqueesControllerTest < ActionController::TestCase
  setup do
    @marquee = marquees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:marquees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create marquee" do
    assert_difference('Marquee.count') do
      post :create, marquee: { text: @marquee.text }
    end

    assert_redirected_to marquee_path(assigns(:marquee))
  end

  test "should show marquee" do
    get :show, id: @marquee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @marquee
    assert_response :success
  end

  test "should update marquee" do
    put :update, id: @marquee, marquee: { text: @marquee.text }
    assert_redirected_to marquee_path(assigns(:marquee))
  end

  test "should destroy marquee" do
    assert_difference('Marquee.count', -1) do
      delete :destroy, id: @marquee
    end

    assert_redirected_to marquees_path
  end
end
