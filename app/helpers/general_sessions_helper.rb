module GeneralSessionsHelper
  def current_general_user
    @current_general_user ||= GeneralUser.find_by(id: session[:user_id])
  end
end
