module CurrentCart

  def set_cart
    @cart = Cart.find_or_create_by(user_id: current_user.id) if user_signed_in?
  end

end
