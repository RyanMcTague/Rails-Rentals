class Fine < ApplicationRecord
  belongs_to :rental_transaction
  has_one :user, through: :rental_transaction

  def first_day_fine
    return ENV["FIRST_DAY_FINE"].to_f
  end

  def recurring_fine
    return ENV["RECURRING_FINE"].to_f
  end

  def apply days
    self.update( amount: days * self.recurring_fine + self.first_day_fine  )
  end
end
