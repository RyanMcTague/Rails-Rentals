class RemoveCheckedOut < ActiveRecord::Migration[6.1]
  def change
    remove_column :rentals, :checked_out
  end
end
