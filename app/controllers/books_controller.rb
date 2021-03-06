class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  # GET /books or /
  def index
    @books = Book.all
    @books = Book.where(flag: true)
  end

  # GET /books/1 or /books/1.json
  def show
    @book_reviews = BookReview.where(book_id: params[:id], flag: true) 

    if params[:sort] == "created_at"
      @book_reviews = BookReview.where(book_id: params[:id]).order(:created_at => "asc")
    end
    if params[:sort] == "good"
      @book_reviews = BookReview.where(book_id: params[:id]).order(:good => "desc")
    end

  end

  # GET /books/new
  def new
    @book = Book.new(user_id: params[:user_id])
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    @book.flag = false

    respond_to do |format|
      if @book.save
        if params[:book][:comment].present?
          @book_review = BookReview.new
          @book_review.book_id = @book.id
          @book_review.user_id = @book.user_id
          @book_review.comment = params[:book][:comment]
          @book_review.good = 0
          @book_review.flag = false
          @book_review.save
        end
        format.html { redirect_to "/books", notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to home_approval_book_index_path, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    if params[:search][:title].present? 
      @books = Book.where("title like '%" + params[:search][:title] + "%'").order(:created_at => "desc").where(flag: true)
    else
       @books = Book.all.order(:created_at => "desc")
    end

    if params[:search][:author_name].present?
      @books = @books.where("author_name like '%" + params[:search][:author_name] + "%'").order(:created_at => "desc").where(flag: true)
    else
      @books = @books.all.order(:created_at => "desc")
    end
    
    render :index
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:user_id, :isbn, :title, :author_name, :book_number, :flag)
    end
  
    
end
