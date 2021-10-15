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
end
