class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    password = params[:password]
    if user && user.authenticate(password)
      flash[:notice] = "Logged in succesfully."
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Invalid username/password"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = "You have been logged out"
    redirect_to login_path, notice: "You have been logged out"
  end
end
