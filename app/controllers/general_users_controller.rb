class GeneralUsersController < ApplicationController
  def show
    @general_user = GeneralUser.find(params[:id])
  end

  def new
    @general_user = GeneralUser.new
  end

  def create
    @general_user = GeneralUser.new(user_params)
    
    if @general_user.save
      flash[:success] = "ユーザーを登録しました"
      redirect_to @general_user
    else
      flash.now[:danger] = "ユーザーの登録に失敗しました"
      render :new
    end
  end

  def edit
    @general_user = GeneralUser.find(params[:id])
  end

  def update
    @general_user = GeneralUser.find(params[:id])
    
    if @general_user.save
      flash[:success] = "情報を更新しました"
      redirect_to @general_user
    else
      flash.now[:danger] = "情報の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @general_user = GeneralUser.find(params[:id])
    @general_user.destroy
    
    flash[:success] = "アカウントが削除されました"
  end
  
  private
  
  def user_params
    params.require(:general_user).permit(:name, :email, :password, :password_confirmation)
  end
  
end