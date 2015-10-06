class Admin::LettersController < ApplicationController
  before_action :set_admin_letter, only: [:show, :edit, :update, :destroy]

  # GET /admin/letters
  # GET /admin/letters.json
  def index
    @admin_letters = Letter.all
  end

  # GET /admin/letters/1
  # GET /admin/letters/1.json
  def show
  end

  # GET /admin/letters/new
  def new
    @admin_letter = Letter.new
  end

  # GET /admin/letters/1/edit
  def edit
  end

  # POST /admin/letters
  # POST /admin/letters.json
  def create
    category = letter_params[:category]
    @amdin_letters = letter_params[:name].split(' ').map do |letter|
      Letter.create(name: letter, category: category)
    end

    respond_to do |format|
      format.html { redirect_to amdin_letters_path, notice: 'Letter was successfully created.' }
      format.json { render :show, status: :created }
    end
  end

  # PATCH/PUT /admin/letters/1
  # PATCH/PUT /admin/letters/1.json
  def update
    respond_to do |format|
      if @admin_letter.update(admin_letter_params)
        format.html { redirect_to @admin_letter, notice: 'Letter was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_letter }
      else
        format.html { render :edit }
        format.json { render json: @admin_letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/letters/1
  # DELETE /admin/letters/1.json
  def destroy
    @admin_letter.destroy
    respond_to do |format|
      format.html { redirect_to admin_letters_url, notice: 'Letter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_letter
      @admin_letter = Letter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_letter_params
      params.require(:letter).permit(:name, :category)
    end
end
