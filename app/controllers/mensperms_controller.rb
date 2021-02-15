class MenspermsController < ApplicationController
  def index
    @posts = Post.where(category_id: 1)
  end
end
