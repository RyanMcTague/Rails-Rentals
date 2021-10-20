class AddDuedateToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :due, :datetime
  end
end
