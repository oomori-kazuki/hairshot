class MenscolorsController < ApplicationController
  def index
    @posts = Post.where(category_id: 2)
  end
end
