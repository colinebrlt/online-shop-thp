class ItemsController < ApplicationController
  before_action :set_cart
  before_action :all_items, only: [:index]
  before_action :find_item, only: [:show]
  before_action :new_item, only: [:new]
  
  def index
  end 

  def show
  end 

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to(root_path)
    else
      flash.now[:danger] = "Votre chaton n'a pas pu être créé, vous devez ajouter une image!"
      render :new_admin_item
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def all_items
    @items = Item.all.sort
  end

  def new_item
    @item = Item.new
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :picture)
  end
end
