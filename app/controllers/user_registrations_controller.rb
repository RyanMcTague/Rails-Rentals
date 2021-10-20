class UserRegistrationsController < ApplicationController
  def new_view
    
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Successfully created account"
      redirect_to users_path
    else
      flash[:alert] = user.errors.full_messages.to_sentence
      redirect_to users_new_path
    end
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
