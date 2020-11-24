class ChargesController < ApplicationController

  # A mettre dans le controller order ??
  # Changer les routes
  # Clef API en prod
  # Views charges a changer ?
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
        amount: "1200" #@stripe_amount,
        description: 'Paiement de ???', # @cart user ?
        currency: 'eur',
      })
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to cart_path # Modifier le redirect to
    end
    # Order.create ??????
  end

  private
  
  def amounts # Make amount in eur, not in cent
    @cart_amount = # Le total du panier 
    @stripe_amount = @cart_amount * 100
  end 
end
