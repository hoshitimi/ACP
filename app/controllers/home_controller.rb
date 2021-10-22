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
      session[:login_id] = @user.user_id
      session[:login_user_acount] = @user.user_acount
      session[:authority] = @user.authority    
      session[:login_user_point] = @user.point 
      redirect_to home_top_path
    else
      flash.now[:error] = "アカウントまたはパスワードが正しくありません"
      render :login
      end
  end

  def logout
    reset_session      
    flash.now[:error] = "ログアウトしました。"
    render :login   
  end

end
