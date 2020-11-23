class ItemsController < ApplicationController
  def index
    @items = Item.where(validated: true)
  end 

  def show
    @item = Item.find(params[:id])
  end 
end
