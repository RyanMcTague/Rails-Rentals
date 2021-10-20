class Rating < ApplicationRecord
  belongs_to :rental
  belongs_to :movie

  def value
    return ((
      self.audio_rating + self.effects_rating + 
      self.plot_rating + self.experience_rating
    ) / 4).round(1)
  end
end