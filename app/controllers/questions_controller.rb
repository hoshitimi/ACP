class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy best_answer ]

  # GET /questions or /questions.json
  def index
      @questions = Question.all.limit(0)
  end

  # GET /questions/1 or /questions/1.json
  def show
    @question_reviews = QuestionReview.where(question_code: params[:id], best_flag: 0 ).order(:created_at => "desc")
    @question_best_review = QuestionReview.find_by(question_code: params[:id], best_flag: 1)
  end

  # GET /questions/new
  def new
    @question = Question.new
    @question.user_code = session[:login_id]
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "質問が作成されました" }
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
        format.html { redirect_to @question, notice: "質問がアップデートされました" }
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
      format.html { redirect_to questions_url, notice: "質問が削除されました" }
      format.json { head :no_content }
    end
  end

  def best_answer
    @question_reviews = QuestionReview.find(params[:question_reviews][:id])
    @question_reviews.best_flag = 1
    @question_reviews.save
    @best_user_code = @question_reviews.user_code
    @user = User.find_by(user_id: @best_user_code)
    @best_user_point = @user.point + 10
    @user.update(point: @best_user_point)
    redirect_to action: :show, id: @question

  end

  def search
    if params[:search][:category].present?
      @questions = Question.where("category like '%" + params[:search][:category] + "%'").order(:created_at => "desc")
    else
      @questions = Question.all.limit(0)
    end
    if params[:search][:view_count].present?
      @questions = @questions.limit(params[:search][:view_count].to_i)
    end
    if params[:search][:login_id].present?
      @questions = @questions.where("user_code like '%" + params[:search][:login_id] + "%'").order(:created_at => "desc")
    end
;    render :index

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