class LineItemsController < ApplicationController
  before_action :set_cart 
  before_action :set_line_item, only: [:destroy]

  # def new
  #   @line_item = LineItem.new
  # end 

  def edit
  end

  def create
    item = Item.find(params[:item_id])
    @line_item = @cart.line_items.create(item_id: item.id)

    respond_to do |format|
      if @line_item.save
        format.html {redirect_to root_path, notice: "Produit ajouté au panier !"}
        format.json {render :show, status: :created, location: @line_item}
        format.js {}
      else
        format.html {render :new}
        format.json {render json: @line_item.errors, status: :unprocessable_entity}
        format.js {}
      end 
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_items_params)
        format.html {redirect_to @line_item, notice: "Produit mis à jour !"}
        format.json {render :show, status: :ok, location: @line_item}
        format.js {}
      else
        format.html {render :edit}
        format.json {render json: @line_item.errors, status: :unprocessable_entity}
        # format.js {}
      end 
    end 
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html {redirect_to @cart, notice: "Produit retiré du panier !"}
      format.json {head :no_content}
      format.js {}
    end 
  end

  private 

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end 

  def line_items_params
    params.require(:line_item).permit(:cart_id, :item_id, :quantity)
  end 
end
