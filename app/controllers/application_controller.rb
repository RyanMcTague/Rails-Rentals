class ApplicationController < ActionController::Base
  before_action :set_user
  
  def require_user_logged_in!
    if Current.user.nil?
      flash[:alert] = "Must be logged in!"
      redirect_to users_login_path
    end
  end

  def require_user_to_be_admin!
    if Current.user.nil? || Current.user.client?
      flash[:alert] = "Must be Admin!"
      redirect_to users_path
    end
  end

  def set_user
    Current.user = User.find_by(id: session[:user_id])
  end

  def set_rental
    @rental = Rental.find_by(id: params[:id])
    if @rental.nil?
      flash[:alert] = "Cannot find rental!"
      redirect_to users_path
    end
  end

  def set_movie
    @movie = Movie.find_by(id: params[:id])
    if @movie.nil?
      flash[:alert] = "Movie cannot be found!"
      redirect_to movies_path 
    end
  end

  def set_transaction
    @transaction = RentalTransaction.find_by(id: params[:id])
    if @transaction.nil?
      flash[:alert] = "Cannot find transaction"
      redirect_to users_path
    end
  end
end
