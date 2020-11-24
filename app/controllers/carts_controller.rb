class CartsController < ApplicationController
  include CurrentCart
  before_action :authenticate_user!, :set_cart

  def show
  end

  def update
  end
end
