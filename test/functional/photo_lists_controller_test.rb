require 'test_helper'

class PhotoListsControllerTest < ActionController::TestCase
  setup do
    @photo_list = photo_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_list" do
    assert_difference('PhotoList.count') do
      post :create, photo_list: {  }
    end

    assert_redirected_to photo_list_path(assigns(:photo_list))
  end

  test "should show photo_list" do
    get :show, id: @photo_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_list
    assert_response :success
  end

  test "should update photo_list" do
    put :update, id: @photo_list, photo_list: {  }
    assert_redirected_to photo_list_path(assigns(:photo_list))
  end

  test "should destroy photo_list" do
    assert_difference('PhotoList.count', -1) do
      delete :destroy, id: @photo_list
    end

    assert_redirected_to photo_lists_path
  end
end
