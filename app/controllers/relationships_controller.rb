class RelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    user = User.find(params[:user_id])
    current_general_user.follow(user)
    flash[:success] = "ユーザーをフォローしました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = User.find(params[:user_id])
    current_general_user.unfollow(user)
    flash[:success] = "ユーザーのフォローを解除しました"
    redirect_back(fallback_location: root_path)
  end
end
