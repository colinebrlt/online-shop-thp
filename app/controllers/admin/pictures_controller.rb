class Admin::PicturesController < Admin::FacadeController

  def create
    @item = User.find(params[:item_id])
    @item.picture.attach(params[:picture])
    redirect_to(root_path)
  end
end