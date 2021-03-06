class BookReviewsController < ApplicationController
  before_action :set_book_review, only: %i[ show edit update destroy ]

  # GET /book_reviews or /book_reviews.json
  def index
    @book_reviews = BookReview.where(flag:true)
  end

  # GET /book_reviews/1 or /book_reviews/1.json
  def show
  end

  # GET /book_reviews/new
  def new
    @book_review = BookReview.new(user_id: session[:login_id],book_id: params[:book_id])
    @book_review.good = 0
    @book_title = params[:book_title]
    @book_author_name = params[:book_author_name]
  end

  # GET /book_reviews/1/edit
  def edit
  end

  # POST /book_reviews or /book_reviews.json
  def create
    @book_review = BookReview.new(book_review_params)
    @book_review.flag = false

    @user = User.find_by(user_id: @book_review.user_id)
    @book_review.good = 0
    respond_to do |format|
      if @book_review.save
        format.html { redirect_to @book_review, notice: "Book review was successfully created." }
        format.json { render :show, status: :created, location: @book_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_review.errors, status: :unprocessable_entity }
      end
  end
end

  # PATCH/PUT /book_reviews/1 or /book_reviews/1.json
  def update
    respond_to do |format|
      if @book_review.update(book_review_params)
        format.html { redirect_to @book_review, notice: "Book review was successfully updated." }
        format.json { render :show, status: :ok, location: @book_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_reviews/1 or /book_reviews/1.json
  def destroy
    @book_review.destroy
    respond_to do |format|
      format.html { redirect_to book_reviews_url, notice: "Book review was successfully destroyed." }
      format.json { head :no_content }
    end
  end
   def good_add
    @book_review = BookReview.find(params[:good][:book_review_code])
    #??????????????????????????????????????????????????????????????????????????????????????????
    #??????????????????????????????????????????????????????????????????
    @user_good = session[:login_id]
    @book_user_code = @book_review.user_id
    if @user_good == @book_user_code
       @book_review.good -= 1
    else
       @book_review.good += 1
    end

   if  @book_review.good == 15
      @user = User.find_by(user_id: @book_user_code)
      @book_point =@user.point + 5
      @user.update(point: @book_point)
   end

    respond_to do |format|
      if @book_review.save
        format.html { redirect_to book_path(@book_review.book_id), notice: "???????????????????????????????????????????????????????????????????????????????????????????????????" }
        format.json { render :show, status: :created, location: @book_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_review.errors, status: :unprocessable_entity }
      end
    end
   end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_review
      @book_review = BookReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_review_params
      params.require(:book_review).permit(:book_id, :user_id, :user_acount, :comment, :good, :flag)
    end
end
