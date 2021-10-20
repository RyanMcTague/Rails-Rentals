class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :price, default: 0
      t.belongs_to :rental, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :given_condition, default: 0
      t.string :returned_condition, default: 0
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
