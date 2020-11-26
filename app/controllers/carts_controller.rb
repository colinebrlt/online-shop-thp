class CartsController < ApplicationController
  before_action :authenticate_user!, :set_cart

  def show
  end

  def update
    @cart.empty
    respond_to do |format|
      format.html {redirect_to @cart, notice: "Votre panier a bien été vidé !"}
      format.json {head :no_content}
      format.js {}
    end 
  end
end
