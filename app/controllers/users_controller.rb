class UsersController < ApplicationController
  before_action :require_user_logged_in!

  def current_view
    Current.user.apply_late_fees
    if Current.user.admin?
      redirect_to admin_path
    end
  end
end
