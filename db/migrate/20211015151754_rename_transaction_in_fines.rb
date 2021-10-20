class RenameTransactionInFines < ActiveRecord::Migration[6.1]
  def change
    rename_column :fines, :transaction_id, :rental_transaction_id
  end
end
