class AddActiveToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :active, :boolean ,:default => true 
  end
end
