class ChangeTransactionsToRentalTransactions < ActiveRecord::Migration[6.1]
  def change
    rename_table :transactions, :rental_transactions
  end
end
