class AdminController < ApplicationController
  before_action :require_user_to_be_admin!
  def index_view
  end
end
