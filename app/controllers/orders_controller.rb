class OrdersController < ApplicationController

  before_action :amounts

  def new
  end
  
  def create
    begin
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @stripe_amount,
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
    @cart = current_user.cart
    @cart_amount = @cart.total_price
    @stripe_amount = (@cart_amount * 100).to_i
  end
end
