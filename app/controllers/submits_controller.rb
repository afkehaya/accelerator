class SubmitsController < ApplicationController
  before_action :set_submit, only: [:show, :edit, :update, :destroy]

  # GET /submits
  # GET /submits.json
  def index
    @submits = Submit.all
  end

  # GET /submits/1
  # GET /submits/1.json
  def show
  end

  # GET /submits/new
  def new
    @submit = Submit.new
    @questions = Question.all
  end

  # GET /submits/1/edit
  def edit
  end

  # POST /submits
  # POST /submits.json
  def create
  byebug
    @submit = Submit.new(submit_params)
    @submit.save
    params[:submit][:question_ids].each do |question_id|
      @question = Question.find(question_id)
      @submit.questions << @question
    end
    
 
    respond_to do |format|
      if @submit.save
        format.html { redirect_to @submit, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @submit }
      else
        format.html { render :new }
        format.json { render json: @submit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submits/1
  # PATCH/PUT /submits/1.json
  def update
    respond_to do |format|
      if @submit.update(submit_params)
        format.html { redirect_to @submit, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @submit }
      else
        format.html { render :edit }
        format.json { render json: @submit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submits/1
  # DELETE /submits/1.json
  def destroy
    @submit.destroy
    respond_to do |format|
      format.html { redirect_to submits_url, notice: 'Submit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submit
      @submit = Submit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submit_params
      params.require(:submit).permit(:name, :user_id, question_ids: [] )
    end
end
