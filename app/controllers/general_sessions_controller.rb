class GeneralSessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = "一般ユーザーのログインに成功しました"
      redirect_to @general_user
    else
      flash.now[:danger] = "一般ユーザーのログインに失敗しました"
      render :new
    end
  end

  def destroy
    session[:general_user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to root_url
  end
  
  private
  
  def login(email, password)
    @general_user = GeneralUser.find_by(email: email)
    if @general_user && @general_user.authenticate(password)
      session[:general_user_id] = @general_user.id
      return true
    else
      return false
    end
  end
end
