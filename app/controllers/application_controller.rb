class ApplicationController < ActionController::Base
  include SessionsHelper
  include GeneralSessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  
  def general_user_counts(user)
    @count_followings = user.followings.count
    @count_favorites = user.favorites.count
  end
  
  
  
end
