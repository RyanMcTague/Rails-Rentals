class Movie < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :rentals
  has_one_attached :photo
  has_many :ratings

  def rental_history
    count = 0
    self.rentals.each do |rental|
      rental.rental_transactions.count.times do
        count += 1
      end
    end
    return count
  end

  def rating
    sum = 0
    count = self.ratings.count
    if count == 0 
      return 0
    else
      self.ratings.each do |rating|
        sum += rating.value
      end
      return sum / count
    end
  end

  def rating_count
    return self.ratings.count
  end

  def activate
    self.update(active: true)
  end

  def remove
    self.update(active: false)
  end

end
