class Admin::ItemsController < Admin::FacadeController
  before_action :new_item, only: [:new]

  def new
  end

  def create

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