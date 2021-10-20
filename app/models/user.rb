class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :password_confirmation
  validates_uniqueness_of :email
  has_many :rentals
  has_many :rental_transactions
  has_many :fines, through: :rental_transactions


  def has_fines?
    self.apply_late_fees
    return Fine.where(user_id: self.id, paid: false).count > 0
  end

  def admin?
    return self.is_admin
  end

  def client?
    return !self.is_admin
  end

  def cart_total
    total = 0
    self.rentals.each do |rental|
      if !rental.checked_out?
        total += rental.cost
      end
    end 
    return total.round(2)
  end

  def check_out 
    self.rentals.each do |rental|
      if !rental.checked_out?
        rental.check_out
      end
    end
  end

  def apply_late_fees 
    self.rental_transactions.each do |transaction|
      transaction.apply_late_fee
    end
  end

  def cart 
    return Rental.where(user_id: Current.user.id, state: :in_cart)
  end
end
