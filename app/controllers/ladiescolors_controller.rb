class LadiescolorsController < ApplicationController
  def index
    @posts = Post.where(category_id: 4).order(id: :desc).page(params[:page]).per(10)
  end
end
