class GeneralUsersController < ApplicationController
   before_action :require_user_logged_in, only: [:show, :edit, :followings]
   before_action :set_general_user, only: [:show, :edit, :update, :destroy, :followings, :likes]
  
  def show
    @followings = @general_user.followings.page(params[:page]).per(3)
    @likes = @general_user.favorite_posts.page(params[:page]).per(3)
  end

  def new
    @general_user = GeneralUser.new
  end

  def create
    @general_user = GeneralUser.new(user_params)
    
    if @general_user.save
      flash[:success] = "ユーザーを登録しました"
      redirect_to general_login_url
    else
      flash.now[:danger] = "ユーザーの登録に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @general_user.update(user_params)
      flash[:success] = "情報を更新しました"
      redirect_to @general_user
    else
      flash.now[:danger] = "情報の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @general_user.destroy
    
    flash[:success] = "アカウントが削除されました"
    redirect_to root_url
  end
  
  def followings
    @followings = @general_user.followings.page(params[:page])
  end
  
  def likes
    @likes = @general_user.favorite_posts.page(params[:page])
  end
  
  private
  
  def user_params
    params.require(:general_user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def set_general_user
    @general_user = GeneralUser.find(params[:id])
  end
end
