class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
    @question_reviews = QuestionReview.where(question_code: params[:id], best_flag: 0)
    @question_best_review = QuestionReview.where(question_code: params[:id], best_flag: 1)
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "質問が作成されました　Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: "質問がアップデートされました　Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: "質問が削除されました　Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    if params[:search][:category].present?
      @questions = Question.where("category like '%" + params[:search][:category] + "%'").order(:created_at => "desc")
    else
      @questions = Question.all.order(:created_at => "desc")
    end
    render :index
  end

  def best_answer
    @question_reviews = QuestionReview.find(params[:question_reviews][:id])
    @question_reviews.best_flag = 1
    @question_reviews.save

    logger.debug("=================")
    logger.debug("ここまで来たよ～")
    logger.debug("=================")

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:user_code, :category, :title, :contents)
    end

end