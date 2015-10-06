class Admin::TestPapersController < ApplicationController
  before_action :set_admin_test_paper, only: [:show, :edit, :update, :destroy]

  # GET /admin/test_papers
  # GET /admin/test_papers.json
  def index
    @admin_test_papers = TestPaper.all
  end

  # GET /admin/test_papers/1
  # GET /admin/test_papers/1.json
  def show
    @letters = Letter.all.group_by(&:category)
  end

  # GET /admin/test_papers/new
  def new
    @admin_test_paper = TestPaper.new
    @letters = Letter.all.group_by(&:category)
  end

  # GET /admin/test_papers/1/edit
  def edit
    @letters = Letter.all.group_by(&:category)
  end

  # POST /admin/test_papers
  # POST /admin/test_papers.json
  def create
    @admin_test_paper = TestPaper.new(admin_test_paper_params)

    respond_to do |format|
      if @admin_test_paper.save
        format.html { redirect_to admin_test_paper_path(@admin_test_paper), notice: 'Test paper was successfully created.' }
        format.json { render :show, status: :created, location: @admin_test_paper }
      else
        format.html { render :new }
        format.json { render json: @admin_test_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/test_papers/1
  # PATCH/PUT /admin/test_papers/1.json
  def update
    respond_to do |format|
      if @admin_test_paper.update(admin_test_paper_params)
        format.html { redirect_to @admin_test_paper, notice: 'Test paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_test_paper }
      else
        format.html { render :edit }
        format.json { render json: @admin_test_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/test_papers/1
  # DELETE /admin/test_papers/1.json
  def destroy
    @admin_test_paper.destroy
    respond_to do |format|
      format.html { redirect_to admin_test_papers_url, notice: 'Test paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_test_paper
      @admin_test_paper = TestPaper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_test_paper_params
      params.require(:test_paper).permit(:name, :order, :description, letter_ids: [])
    end
end
