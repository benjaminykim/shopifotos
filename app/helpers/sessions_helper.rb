module SessionsHelper
  # log in a given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # returns the logged-in user
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # returns user logged in state
  def logged_in
    !current_user.nil?
  end
end