class ApplicationController < ActionController::Base
  include SessionsHelper
  include GeneralSessionsHelper
 
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_posts = user.posts.count_posts
    @count_followings = user.followings.count_posts
  end
  
end
