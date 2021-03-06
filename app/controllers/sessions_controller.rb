class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    user = User.find_by(email: email)
    if user&.authenticate(password)
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      remember user
      redirect_to user
    else
      flash.now[:danger] = "Invalid login credentials"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
