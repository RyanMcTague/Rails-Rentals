class AddIsRatedToRentalTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :rental_transactions, :rated, :boolean, :default => false
  end
end
