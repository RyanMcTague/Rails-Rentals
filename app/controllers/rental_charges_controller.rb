class RentalChargesController < ApplicationController
  before_action :require_rentals_to_be_available!, only: :create
  def new
  end

  def create
    @amount = (Current.user.cart_total * 100).round(0)
    Current.user.check_out
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to rental_charges_new_path
  end

  def require_rentals_to_be_available!
    if Current.cart.count == 0
      flash[:alert] = "One or more items not avaible"
      redirect_to rental_charges_new_path
    end
  end
end
