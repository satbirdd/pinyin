class TestsController < ApplicationController
  before_action :set_paper
  before_action :set_test, only: [:show, :edit, :update, :destroy, :read_correct, :read_wrong, :finish]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    if @test.started
      raise ActiveRecord::RecordNotFound
    end

    @letters = @test.letters
    @test.update(started: true)
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = @paper.tests.build

    respond_to do |format|
      if @test.save
        format.html { redirect_to paper_test_path(@paper, @test), notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def read_correct
    @test.items.create(letter_id: params[:letter_id], get: true)

    render json: {}, status: :ok
  end

  def read_wrong
    @test.items.create(letter_id: params[:letter_id], get: false)

    render json: {}, status: :ok
  end

  def finish
    @test.update_attribute('time', params[:time])

    correct_counter = @test.items.where(get: true).count
    wrong_counter = @test.items.where(get: false).count

    @test.update_attributes(correct: correct_counter, wrong: wrong_counter)

    render json: {correct: correct_counter, wrong: wrong_counter}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = @paper.tests.find(params[:id])
    end

    def set_paper
      @paper = Paper.find(params[:paper_id])
    end
end
