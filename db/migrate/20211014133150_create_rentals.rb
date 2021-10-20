class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.string :condition, default: "new"
      t.belongs_to :movie, null: false, foreign_key: true
      t.boolean :checked_out, default: false

      t.timestamps
    end
  end
end
