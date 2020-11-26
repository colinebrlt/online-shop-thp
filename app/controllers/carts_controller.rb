class CartsController < ApplicationController
  before_action :authenticate_user!, :set_cart
  before_action :redirect_user_if_not_author

  def show
  end

  def update
    @cart.empty
    respond_to do |format|
      format.html {redirect_to @cart, notice: "Votre panier a été vidé"}
      format.json {head :no_content}
      format.js {}
    end 
  end

  private

  def redirect_user_if_not_author
    cart = Cart.find(params[:id])
    unless current_user.id == cart.user_id
      flash[:danger] = "Vous n'êtes pas le propriétaire de ce panier !!"
      redirect_back(fallback_location: root_path)
    end
  end

end
