require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { address_line1: @student.address_line1, address_line2: @student.address_line2, city: @student.city, country: @student.country, dob: @student.dob, emergency_contact: @student.emergency_contact, first_name: @student.first_name, last_name: @student.last_name, parent_id: @student.parent_id, school_id: @student.school_id, state: @student.state, zip: @student.zip }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { address_line1: @student.address_line1, address_line2: @student.address_line2, city: @student.city, country: @student.country, dob: @student.dob, emergency_contact: @student.emergency_contact, first_name: @student.first_name, last_name: @student.last_name, parent_id: @student.parent_id, school_id: @student.school_id, state: @student.state, zip: @student.zip }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
