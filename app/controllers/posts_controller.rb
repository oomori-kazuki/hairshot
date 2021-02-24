class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user,  only: [:destroy]
  before_action :set_post, only: [:show, :edit, :update]

  def show
  end

  def new
    @post = current_user.posts.build
    @categoris = Category.all
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      flash[:success] = "投稿が完了しました"
      redirect_to @post
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(posts_params)
     flash[:success] = "投稿が更新されました"
     redirect_to @post
    else
      flash.now[:danger] = "投稿の更新に失敗しました"
      render edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def posts_params
    params.require(:post).permit(:title, :image, :category_id)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end
