class AddFieldsToRating < ActiveRecord::Migration[6.1]
  def change
    remove_column :ratings, :value
    add_column :ratings, :audio_rating, :integer, :default => 5
    add_column :ratings, :effects_rating, :integer, :default => 5
    add_column :ratings, :plot_rating, :integer, :default => 5
    add_column :ratings, :experience_rating, :integer, :default => 5
  end
end
