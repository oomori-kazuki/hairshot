class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Posr.find(params[:post_id])
    current_general_user.favorite(post)
    flash[:success] = "お気に入りに追加しました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_general_user.unfavorite(post)
    flash[:success] = "お気に入りから解除しました"
    redirect_back(fallback_location: root_path)
  end
end
