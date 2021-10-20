class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.string :description, default: "Movie Description..."
      t.integer :rating, default: 0

      t.timestamps
    end
  end
end
