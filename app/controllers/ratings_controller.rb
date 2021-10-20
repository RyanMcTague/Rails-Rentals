class RatingsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_transaction


  def new_view
    @rental = @transaction.rental
  end

  def create
    @rating = @transaction.rate(
      audio:  params[:audio].to_i,
      effects: params[:effects].to_i,
      plot: params[:plot].to_i,
      experince: params[:experince].to_i,
    )
    flash[:notice] = "Rated #{@rental.movie.name} a #{@rating.value} / 10"
    redirect_to users_path
  end
end
