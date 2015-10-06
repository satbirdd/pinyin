require 'test_helper'

class Admin::LettersControllerTest < ActionController::TestCase
  setup do
    @admin_letter = admin_letters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_letters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_letter" do
    assert_difference('Admin::Letter.count') do
      post :create, admin_letter: { category: @admin_letter.category, name: @admin_letter.name }
    end

    assert_redirected_to admin_letter_path(assigns(:admin_letter))
  end

  test "should show admin_letter" do
    get :show, id: @admin_letter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_letter
    assert_response :success
  end

  test "should update admin_letter" do
    patch :update, id: @admin_letter, admin_letter: { category: @admin_letter.category, name: @admin_letter.name }
    assert_redirected_to admin_letter_path(assigns(:admin_letter))
  end

  test "should destroy admin_letter" do
    assert_difference('Admin::Letter.count', -1) do
      delete :destroy, id: @admin_letter
    end

    assert_redirected_to admin_letters_path
  end
end
