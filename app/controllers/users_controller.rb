class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :mensperms, :menscolors, :ladiesperms, :ladiescolors]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @posts = @user.posts.order(id: :desc).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザーを登録しました"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザーの登録に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "情報を更新しました"
      redirect_to @user
    else
      flash.now[:danger] = "情報の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @user.destroy
    
    flash[:success] = "アカウントが削除されました"
    redirect_to root_url
  end
  
  def mensperms
    @posts = @user.posts.where(category_id: 1).order(id: :desc).page(params[:page]).per(10)
  end
  
  def menscolors
    @posts = @user.posts.where(category_id: 2).order(id: :desc).page(params[:page]).per(10)
  end
  
  def ladiesperms
    @posts = @user.posts.where(category_id: 3).order(id: :desc).page(params[:page]).per(10)
  end
  
  def ladiescolors
    @posts = @user.posts.where(category_id: 4).order(id: :desc).page(params[:page]).per(10)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :image)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
