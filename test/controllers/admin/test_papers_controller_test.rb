require 'test_helper'

class Admin::TestPapersControllerTest < ActionController::TestCase
  setup do
    @admin_test_paper = admin_test_papers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_test_papers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_test_paper" do
    assert_difference('Admin::TestPaper.count') do
      post :create, admin_test_paper: {  }
    end

    assert_redirected_to admin_test_paper_path(assigns(:admin_test_paper))
  end

  test "should show admin_test_paper" do
    get :show, id: @admin_test_paper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_test_paper
    assert_response :success
  end

  test "should update admin_test_paper" do
    patch :update, id: @admin_test_paper, admin_test_paper: {  }
    assert_redirected_to admin_test_paper_path(assigns(:admin_test_paper))
  end

  test "should destroy admin_test_paper" do
    assert_difference('Admin::TestPaper.count', -1) do
      delete :destroy, id: @admin_test_paper
    end

    assert_redirected_to admin_test_papers_path
  end
end
