class HomeController < ApplicationController
  def top
  end

  def kanri
  end

  def login
  end

  def login_check
  end

  def logout
  end

  def search
    if params[:search][:title].present?
      @books = Book.where("title like '%" + params[:search][:title] + "%'").order(:created_at => "desc")
    else
      @books = Book.all.order(:created_at => "desc")
    end
    render :top
  end


end
