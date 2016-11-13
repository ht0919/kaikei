require 'test_helper'

class KeihisControllerTest < ActionController::TestCase
  setup do
    @keihi = keihis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keihis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keihi" do
    assert_difference('Keihi.count') do
      post :create, keihi: { date: @keihi.date, kamoku_id_id: @keihi.kamoku_id_id, kingaku: @keihi.kingaku, tekiyou: @keihi.tekiyou }
    end

    assert_redirected_to keihi_path(assigns(:keihi))
  end

  test "should show keihi" do
    get :show, id: @keihi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @keihi
    assert_response :success
  end

  test "should update keihi" do
    patch :update, id: @keihi, keihi: { date: @keihi.date, kamoku_id_id: @keihi.kamoku_id_id, kingaku: @keihi.kingaku, tekiyou: @keihi.tekiyou }
    assert_redirected_to keihi_path(assigns(:keihi))
  end

  test "should destroy keihi" do
    assert_difference('Keihi.count', -1) do
      delete :destroy, id: @keihi
    end

    assert_redirected_to keihis_path
  end
end
