require 'test_helper'

class SchoolUsersControllerTest < ActionController::TestCase
  setup do
    @school_user = school_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_user" do
    assert_difference('SchoolUser.count') do
      post :create, school_user: { contact: @school_user.contact, email_id: @school_user.email_id, first_name: @school_user.first_name, last_name: @school_user.last_name, login_id: @school_user.login_id, password: @school_user.password, role_id: @school_user.role_id, school_id: @school_user.school_id }
    end

    assert_redirected_to school_user_path(assigns(:school_user))
  end

  test "should show school_user" do
    get :show, id: @school_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_user
    assert_response :success
  end

  test "should update school_user" do
    patch :update, id: @school_user, school_user: { contact: @school_user.contact, email_id: @school_user.email_id, first_name: @school_user.first_name, last_name: @school_user.last_name, login_id: @school_user.login_id, password: @school_user.password, role_id: @school_user.role_id, school_id: @school_user.school_id }
    assert_redirected_to school_user_path(assigns(:school_user))
  end

  test "should destroy school_user" do
    assert_difference('SchoolUser.count', -1) do
      delete :destroy, id: @school_user
    end

    assert_redirected_to school_users_path
  end
end
