class QuestionReviewsController < ApplicationController
  before_action :set_question_review, only: %i[ show edit update destroy ]

  # GET /question_reviews or /question_reviews.json
  def index
    @question_reviews = QuestionReview.all
  end

  # GET /question_reviews/1 or /question_reviews/1.json
  def show
  end

  # GET /question_reviews/new
  def new
    @question_review = QuestionReview.new
  end

  # GET /question_reviews/1/edit
  def edit
  end

  # POST /question_reviews or /question_reviews.json
  def create
    @question_review = QuestionReview.new
    @question_review.question_code = params[:contents][:question_code]
    @question_review.contents = params[:contents][:contents]
    @question_review.best_flag = 0
    @question_review.user_code = session[:login_id]

    respond_to do |format|
      if @question_review.save
        format.html { redirect_to question_path(@question_review.question_code), notice: "Question review was successfully created." }
        format.json { render :show, status: :created, location: @question_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question_review.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /question_reviews/1 or /question_reviews/1.json
  def update
    respond_to do |format|
      if @question_review.update(question_review_params)
        format.html { redirect_to @question_review, notice: "Question review was successfully updated." }
        format.json { render :show, status: :ok, location: @question_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_reviews/1 or /question_reviews/1.json
  def destroy
    @question_review.destroy
    respond_to do |format|
      format.html { redirect_to question_reviews_url, notice: "Question review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_review
      @question_review = QuestionReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_review_params
      params.require(:question_review).permit(:question_code, :user_code, :contents, :best_flag)
    end
end
