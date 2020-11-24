class OrdersController < ApplicationController

  # before_action :amounts
# Vérifer les conversions des prices dans le model cart et de partout !
  def new
    @cart = current_user.cart
  end
  
  def create
    @cart = current_user.cart
    begin
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @cart.total_price * 100,
        description: 'Paiement de user.email',
        currency: 'eur',
      })
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to current_user.cart
    end
    # Order.create ??????
  end

  private
  
  def amounts # Make amount in eur, not in cent
    @cart_amount = @cart.total_price
    @stripe_amount = @cart_amount * 100
  end
end
