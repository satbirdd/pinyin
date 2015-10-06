class PaperLettersController < ApplicationController
  before_action :set_paper_letter, only: [:show]

  # GET /paper_letters
  # GET /paper_letters.json
  def index
    @paper_letters = PaperLetter.all
  end

  # GET /paper_letters/1
  # GET /paper_letters/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper_letter
      @paper_letter = PaperLetter.find(params[:id])
    end
end
