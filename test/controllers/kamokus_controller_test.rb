require 'test_helper'

class KamokusControllerTest < ActionController::TestCase
  setup do
    @kamoku = kamokus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kamokus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kamoku" do
    assert_difference('Kamoku.count') do
      post :create, kamoku: { name: @kamoku.name }
    end

    assert_redirected_to kamoku_path(assigns(:kamoku))
  end

  test "should show kamoku" do
    get :show, id: @kamoku
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kamoku
    assert_response :success
  end

  test "should update kamoku" do
    patch :update, id: @kamoku, kamoku: { name: @kamoku.name }
    assert_redirected_to kamoku_path(assigns(:kamoku))
  end

  test "should destroy kamoku" do
    assert_difference('Kamoku.count', -1) do
      delete :destroy, id: @kamoku
    end

    assert_redirected_to kamokus_path
  end
end
