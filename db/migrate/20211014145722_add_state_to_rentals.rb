class AddStateToRentals < ActiveRecord::Migration[6.1]
  def change
    add_column  :rentals, :state, :integer, default: 0
  end
end
