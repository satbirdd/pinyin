class TestPapersController < ApplicationController
  before_action :set_test_paper, only: [:show]

  # GET /test_papers
  # GET /test_papers.json
  def index
    @test_papers = TestPaper.all
  end

  # GET /test_papers/1
  # GET /test_papers/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_paper
      @test_paper = TestPaper.find(params[:id])
    end
end
