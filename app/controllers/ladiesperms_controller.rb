class LadiespermsController < ApplicationController
  def index
    @posts = Post.where(category_id: 3).order(id: :desc).page(params[:page]).per(10)
  end
end
