class UserSessionsController < ApplicationController
  before_action :require_user_logged_in!, only: :destroy
  def new_view
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      flash[:notice] = "Welcome back #{user.email}"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Wrong username or password"
      redirect_to users_login_path
    end
  end

  def destroy
    flash[:notice] = "Successfully logged out"
    session[:user_id] = nil
    redirect_to root_path
  end
end
