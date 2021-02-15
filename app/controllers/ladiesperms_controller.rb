class LadiespermsController < ApplicationController
  def index
    @posts = Post.where(category_id: 3)
  end
end
