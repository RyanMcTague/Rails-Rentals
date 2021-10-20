class RentalsController < ApplicationController
  before_action :require_user_to_be_admin!
  before_action :set_rental, only: [:destroy, :return_rental]

  
  def index_view
    @rentals = Rental.all
  end

  def active_view
    @transactions = RentalTransaction.where(state: :checked_out).each
    @transactions.each do |transaction|
      transaction.apply_late_fee
    end
  end


  def new_view
    @movie_names = []
    Movie.all.each do |movie|
      @movie_names.append(movie.name)
    end
  end

  def create
    amount = params[:quantity].to_i
    amount.times do
      @rental = Rental.create(
        condition: params[:condition].downcase,
        movie: Movie.find_by(name: params[:movie_name]),
      )
    end
    flash[:notice] = "Created rental(s)"
    redirect_to admin_path
  end

  def destroy
    @rental.remove_from_stock
    flash[:notice] = "Rental successfully removed"
    redirect_to admin_path
  end

  def return_rental
    @rental.return_to_store
    flash[:notice] = "Returned rental to store!"
    redirect_to admin_path
  end



end
