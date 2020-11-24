class CartsController < ApplicationController
  include CurrentCart
  before_action :authenticate_user!, :set_cart

  def show
  end

  def update
    @cart.empty
    redirect_to cart_path
  end
end
