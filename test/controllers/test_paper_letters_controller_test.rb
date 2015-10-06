require 'test_helper'

class PaperLettersControllerTest < ActionController::TestCase
  setup do
    @paper_letter = paper_letters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paper_letters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paper_letter" do
    assert_difference('PaperLetter.count') do
      post :create, paper_letter: { letter: @paper_letter.letter, paper_id: @paper_letter.paper_id }
    end

    assert_redirected_to paper_letter_path(assigns(:paper_letter))
  end

  test "should show paper_letter" do
    get :show, id: @paper_letter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paper_letter
    assert_response :success
  end

  test "should update paper_letter" do
    patch :update, id: @paper_letter, paper_letter: { letter: @paper_letter.letter, paper_id: @paper_letter.paper_id }
    assert_redirected_to paper_letter_path(assigns(:paper_letter))
  end

  test "should destroy paper_letter" do
    assert_difference('PaperLetter.count', -1) do
      delete :destroy, id: @paper_letter
    end

    assert_redirected_to paper_letters_path
  end
end
