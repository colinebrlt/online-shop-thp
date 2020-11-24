class ItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def index
    @items = Item.all
  end 

  def show
    @item = Item.find(params[:id])
  end 
end
