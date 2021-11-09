class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  # GET /books or /
  def index
    @books = Book.all
    @books = Book.where(flag: true)
  end

  # GET /books/1 or /books/1.json
  def show
    @book_reviews = BookReview.where(book_id: params[:id]) 

    if params[:sort] == "created_at"
      @book_reviews = BookReview.where(book_id: params[:id]).order(:created_at => "asc")
    end

    if params[:sort] == "good"
      @book_reviews = BookReview.where(book_id: params[:id]).order(:good => "desc")
    end

  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    @book.flag = false
    @book_review = BookReview.new(book_review_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
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
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    if params[:search][:title].present? 
      @books = Book.where("title like '%" + params[:search][:title] + "%'").order(:created_at => "desc")
    else
       @books = Book.all.order(:created_at => "desc")
    end

    if params[:search][:author_name].present?
      @books = @books.where("author_name like '%" + params[:search][:author_name] + "%'").order(:created_at => "desc")
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
