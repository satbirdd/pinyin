class TestPaperLettersController < ApplicationController
  before_action :set_test_paper_letter, only: [:show]

  # GET /test_paper_letters
  # GET /test_paper_letters.json
  def index
    @test_paper_letters = TestPaperLetter.all
  end

  # GET /test_paper_letters/1
  # GET /test_paper_letters/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_paper_letter
      @test_paper_letter = TestPaperLetter.find(params[:id])
    end
end
