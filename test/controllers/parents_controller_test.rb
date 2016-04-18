require 'test_helper'

class ParentsControllerTest < ActionController::TestCase
  setup do
    @parent = parents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent" do
    assert_difference('Parent.count') do
      post :create, parent: { contact: @parent.contact, dad_fname: @parent.dad_fname, dad_lname: @parent.dad_lname, email_id: @parent.email_id, login_id: @parent.login_id, mom_fname: @parent.mom_fname, mom_lname: @parent.mom_lname, password: @parent.password }
    end

    assert_redirected_to parent_path(assigns(:parent))
  end

  test "should show parent" do
    get :show, id: @parent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parent
    assert_response :success
  end

  test "should update parent" do
    patch :update, id: @parent, parent: { contact: @parent.contact, dad_fname: @parent.dad_fname, dad_lname: @parent.dad_lname, email_id: @parent.email_id, login_id: @parent.login_id, mom_fname: @parent.mom_fname, mom_lname: @parent.mom_lname, password: @parent.password }
    assert_redirected_to parent_path(assigns(:parent))
  end

  test "should destroy parent" do
    assert_difference('Parent.count', -1) do
      delete :destroy, id: @parent
    end

    assert_redirected_to parents_path
  end
end
