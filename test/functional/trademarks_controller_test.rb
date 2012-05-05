require 'test_helper'

class TrademarksControllerTest < ActionController::TestCase
  setup do
    @trademark = trademarks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trademarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trademark" do
    assert_difference('Trademark.count') do
      post :create, trademark: @trademark.attributes
    end

    assert_redirected_to trademark_path(assigns(:trademark))
  end

  test "should show trademark" do
    get :show, id: @trademark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trademark
    assert_response :success
  end

  test "should update trademark" do
    put :update, id: @trademark, trademark: @trademark.attributes
    assert_redirected_to trademark_path(assigns(:trademark))
  end

  test "should destroy trademark" do
    assert_difference('Trademark.count', -1) do
      delete :destroy, id: @trademark
    end

    assert_redirected_to trademarks_path
  end
end
