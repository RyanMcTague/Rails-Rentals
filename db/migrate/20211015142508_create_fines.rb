class CreateFines < ActiveRecord::Migration[6.1]
  def change
    create_table :fines do |t|
      t.belongs_to :transaction, null: false, foreign_key: true
      t.decimal :amount, default: 0
      t.boolean :paid, default: false
      t.timestamp :date

      t.timestamps
    end
  end
end
