require 'test_helper'

class WorkWithUsControllerTest < ActionController::TestCase
  setup do
    @work_with_u = work_with_us(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_with_us)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_with_u" do
    assert_difference('WorkWithU.count') do
      post :create, work_with_u: { email: @work_with_u.email, name: @work_with_u.name, phone: @work_with_u.phone }
    end

    assert_redirected_to work_with_u_path(assigns(:work_with_u))
  end

  test "should show work_with_u" do
    get :show, id: @work_with_u
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_with_u
    assert_response :success
  end

  test "should update work_with_u" do
    put :update, id: @work_with_u, work_with_u: { email: @work_with_u.email, name: @work_with_u.name, phone: @work_with_u.phone }
    assert_redirected_to work_with_u_path(assigns(:work_with_u))
  end

  test "should destroy work_with_u" do
    assert_difference('WorkWithU.count', -1) do
      delete :destroy, id: @work_with_u
    end

    assert_redirected_to work_with_us_path
  end
end
