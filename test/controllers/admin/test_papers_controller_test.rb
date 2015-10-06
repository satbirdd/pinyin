require 'test_helper'

class Admin::PapersControllerTest < ActionController::TestCase
  setup do
    @admin_paper = admin_papers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_papers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_paper" do
    assert_difference('Admin::Paper.count') do
      post :create, admin_paper: {  }
    end

    assert_redirected_to admin_paper_path(assigns(:admin_paper))
  end

  test "should show admin_paper" do
    get :show, id: @admin_paper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_paper
    assert_response :success
  end

  test "should update admin_paper" do
    patch :update, id: @admin_paper, admin_paper: {  }
    assert_redirected_to admin_paper_path(assigns(:admin_paper))
  end

  test "should destroy admin_paper" do
    assert_difference('Admin::Paper.count', -1) do
      delete :destroy, id: @admin_paper
    end

    assert_redirected_to admin_papers_path
  end
end
