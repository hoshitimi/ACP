class HomeController < ApplicationController
  def top
  end

  def kanri
  end

  def login
  end

  def login_check
    @user_id = params[:user_id]
    @password = params[:password]
    @user = User.find_by(user_id: @user_id, password: @password)
    if  @user.present?
      logger.debug("------------------1--------------------")
      session[:login_id] = @user.user_id
      session[:login_user] = @user.user_acount
      redirect_to home_top_path
    else
      logger.debug("------------------2--------------------")
        render :login, layout: nil
        flash.now[:error] = "アカウントまたはパスワードが正しくありません"
      end
  end

  def logout
  end

end
