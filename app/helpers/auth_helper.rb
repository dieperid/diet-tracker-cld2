module AuthHelper
  def current_user(session)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?(session)
    !!current_user(session)
  end
end
