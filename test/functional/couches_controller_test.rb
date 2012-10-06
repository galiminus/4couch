require 'test_helper'

class CouchesControllerTest < ActionController::TestCase
  setup do
    @couch = couches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:couches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create couch" do
    assert_difference('Couch.count') do
      post :create, couch: { description: @couch.description, title: @couch.title }
    end

    assert_redirected_to couch_path(assigns(:couch))
  end

  test "should show couch" do
    get :show, id: @couch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @couch
    assert_response :success
  end

  test "should update couch" do
    put :update, id: @couch, couch: { description: @couch.description, title: @couch.title }
    assert_redirected_to couch_path(assigns(:couch))
  end

  test "should destroy couch" do
    assert_difference('Couch.count', -1) do
      delete :destroy, id: @couch
    end

    assert_redirected_to couches_path
  end
end
