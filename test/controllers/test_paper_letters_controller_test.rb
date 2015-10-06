require 'test_helper'

class TestPaperLettersControllerTest < ActionController::TestCase
  setup do
    @test_paper_letter = test_paper_letters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_paper_letters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_paper_letter" do
    assert_difference('TestPaperLetter.count') do
      post :create, test_paper_letter: { letter: @test_paper_letter.letter, test_paper_id: @test_paper_letter.test_paper_id }
    end

    assert_redirected_to test_paper_letter_path(assigns(:test_paper_letter))
  end

  test "should show test_paper_letter" do
    get :show, id: @test_paper_letter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_paper_letter
    assert_response :success
  end

  test "should update test_paper_letter" do
    patch :update, id: @test_paper_letter, test_paper_letter: { letter: @test_paper_letter.letter, test_paper_id: @test_paper_letter.test_paper_id }
    assert_redirected_to test_paper_letter_path(assigns(:test_paper_letter))
  end

  test "should destroy test_paper_letter" do
    assert_difference('TestPaperLetter.count', -1) do
      delete :destroy, id: @test_paper_letter
    end

    assert_redirected_to test_paper_letters_path
  end
end
