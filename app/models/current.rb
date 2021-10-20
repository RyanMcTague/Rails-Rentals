class Current < ActiveSupport::CurrentAttributes
  attribute :user


  def cart_total
    return self.user.cart_total
  end

  def check_out 
    return self.user.check_out
  end

  def cart 
    return Rental.where(user_id: Current.user.id, state: :in_cart)
  end

  def rental_transactions
    return self.user.rental_transactions
  end
end