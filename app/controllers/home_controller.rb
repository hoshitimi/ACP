class HomeController < ApplicationController
  def top
  end

  def kanri
  end

  def login
  end

  def login_check
    @user = User.find_by(user_id: "aaa", password: "aaaaa")
    if  @user.present?
      session[:login_id] = user_id
      session[:login_user] = user_acount
      redirect_to home_top_path
    else
      flash[:error] = "アカウントまたはパスワードが正しくありません"
      render :login, layout: nil
    end
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
