class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  # def new
  #   @line_item = LineItem.new
  # end 

  def edit
  end 

  def create
    @line_item = LineItem.new(line_items_params)

    if @line_item.save
      format.html {redirect_to @line_item, notice: "Produit crée !"}
      format.json {render :show, status: :created, location: @line_item}
      format.js {}
    else
      format.html {render :new}
      format.json {render json: @line_item.errors, status: :unprocessable_entity}
      format.js {}
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

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html {redirect_to root_path, notice: "Le produit a été supprimé"}
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
