class OrdersController < ApplicationController
  before_action :set_cart                     , only: [:create]
  before_action :amounts
  before_action :authenticate_user!
  before_action :find_order                   , only: [:show]
  before_action :redirect_user_if_not_author  , only: [:show]

  def new
  end

  def show
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
        description: "Achat d'une photo",
        currency: 'eur',
        })
    
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to current_user.cart
    end

    generate_order(@cart)
    @cart.empty
  end

    
  private

  def find_order
    @order = Order.find(params[:id])
  end
  
  def amounts # Make amount in eur, not in cent
    @cart = current_user.cart
    @cart_amount = @cart.total_price
    @stripe_amount = (@cart_amount * 100).to_i
  end

  def generate_order(cart)
    @order = Order.create(user_id: current_user.id)
    @order.save_cart(cart)
  end

  def redirect_user_if_not_author
    unless current_user.id == @order.user_id
      flash[:danger] = "Vous n'êtes pas le propriétaire de cette commande !!"
      redirect_back(fallback_location: root_path)
    end
  end
end
