class Admin::PapersController < ApplicationController
  before_action :set_admin_paper, only: [:show, :edit, :update, :destroy]

  # GET /admin/papers
  # GET /admin/papers.json
  def index
    @admin_papers = Paper.all
  end

  # GET /admin/papers/1
  # GET /admin/papers/1.json
  def show
    @letters = Letter.all.group_by(&:category)
  end

  # GET /admin/papers/new
  def new
    @admin_paper = Paper.new
    @letters = Letter.all.group_by(&:category)
  end

  # GET /admin/papers/1/edit
  def edit
    @letters = Letter.all.group_by(&:category)
  end

  # POST /admin/papers
  # POST /admin/papers.json
  def create
    @admin_paper = Paper.new(admin_paper_params)

    respond_to do |format|
      if @admin_paper.save
        format.html { redirect_to admin_paper_path(@admin_paper), notice: 'Test paper was successfully created.' }
        format.json { render :show, status: :created, location: @admin_paper }
      else
        format.html { render :new }
        format.json { render json: @admin_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/papers/1
  # PATCH/PUT /admin/papers/1.json
  def update
    respond_to do |format|
      if @admin_paper.update(admin_paper_params)
        format.html { redirect_to @admin_paper, notice: 'Test paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_paper }
      else
        format.html { render :edit }
        format.json { render json: @admin_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/papers/1
  # DELETE /admin/papers/1.json
  def destroy
    @admin_paper.destroy
    respond_to do |format|
      format.html { redirect_to admin_papers_url, notice: 'Test paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_paper
      @admin_paper = Paper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_paper_params
      params.require(:paper).permit(:name, :order, :description, letter_ids: [])
    end
end
