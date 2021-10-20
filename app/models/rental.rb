class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :user, optional: true
  has_many :rental_transactions
  has_many :fines, through: :rental_transactions
  enum state: [:available, :in_cart, :checked_out, :removed]
  has_one :rating
  
  def current_transaction
    if self.user.present?
      return RentalTransaction.find_by(user_id: self.user.id, rental_id: self.id, state: :checked_out)
    else
      return nil
    end
  end

  def fine
    if self.user.present?
      return Fine.find_by(rental_transaction: current_transaction, paid: false)
    else
      return nil
    end
  end

  def pay_fine
    if self.fine.present? 
      fine.update(paid: true)
    end
  end

  def fine_total
    if self.user.present? && self.fine.present?
      return self.fine.amount
    else
      return nil
    end
  end

  def bad_condition?
    return self.condition == 'bad'
  end

  def fair_condition?
    return self.condition == 'fair'
  end

  def new_condition?
    return self.condition == 'new'
  end

  def in_stock?
    return !self.checked_out
  end

  def base_price
    return ENV["RENTAL_COST_PER_PERIOD"].to_f
  end

  def condition_increase
    return ENV["CONDITION_INCREASE"].to_f
  end

  def cost
    if self.bad_condition?
      return (self.base_price ).round(2)
    elsif self.fair_condition?
      return (self.base_price * (1 + self.condition_increase)).round(2)
    else self.bad_condition?
      return (self.base_price * (1 + 2 * self.condition_increase)).round(2)
    end
  end

  def add_to_cart user
    self.update(user_id: user.id, state: :in_cart)
  end

  def remove_from_cart 
    self.update(user_id: nil, state: :available)
  end
  
  def rental_duration
    return ENV['RENTAL_DURATION_IN_DAYS'].to_i.days
  end

  def check_out
    if self.in_cart?
      self.update(state: :checked_out)
      RentalTransaction.create(
        user_id: self.user.id, 
        rental_id: self.id, 
        price: self.cost,
        given_condition: self.condition,
        state: :checked_out,
        due: rental_duration.from_now.beginning_of_day
      )
    end
  end

  def return_to_store 
    if self.checked_out?
      self.current_transaction.update(state: :completed)
      self.update(user_id: nil, state: :available)
    end
  end

  def remove_from_stock
    self.update(state: :removed)
  end 

end
