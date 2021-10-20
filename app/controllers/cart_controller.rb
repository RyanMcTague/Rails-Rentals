class CartController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_rental
  
  def add_rental_to_cart
    if @rental.available? 
      @rental.add_to_cart Current.user
      flash[:notice] = "#{@rental.movie.name} was added to your cart!"
      redirect_to movies_path
    else
      flash[:alert] = "That copy of the movie is currently unavailable"
      redirect_to movies_path
    end
  end

  def remove_rental_from_cart
    @rental.remove_from_cart
    redirect_to new_rental_charge_path
  end

end
