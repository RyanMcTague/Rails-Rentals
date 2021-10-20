class RentalTransaction < ApplicationRecord
  belongs_to :rental
  belongs_to :user
  has_one :fine
  enum state: [:checked_out, :completed]
  has_one :movie, through: :rental

  def overdue?
    return self.due.past?
  end

  def due_today?
    return self.due.today?
  end

  def days_overdue
    days_overdue = ((Time.now - self.due) / (60 * 60 * 24)).floor
    if self.checked_out? && days_overdue > 0
      return days_overdue
    else  
      return 0
    end
  end

  def apply_late_fee
    if self.overdue? && self.fine.present?
      self.fine.apply(self.days_overdue)
    elsif self.overdue? 
      fine = Fine.create(
        rental_transaction: self.id,
        date: Time.now.beginning_of_day
      )
      fine.apply(self.days_overdue)
    end
  end

  def fine_total 
    return self.rental.fine_total
  end

  def rate  rating
    if !self.rated
      self.update(rated: true)
      return Rating.create(
        rental: self.rental,
        movie: self.movie,
        audio_rating: rating[:audio], 
        effects_rating:  rating[:effects],
        plot_rating: rating[:plot],
        experience_rating: rating[:experince] 
      )
    else
      return nil
    end
  end
end
