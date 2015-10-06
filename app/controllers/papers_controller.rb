class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :read_correct, :read_wrong, :finish]

  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.all
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
    @letters = @paper.letters.order(id: :asc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end
end
