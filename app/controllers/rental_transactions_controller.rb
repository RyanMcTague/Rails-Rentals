class RentalTransactionsController < ApplicationController
  before_action :require_user_to_be_admin!
  before_action :set_transaction


  def index_view
  end



end
