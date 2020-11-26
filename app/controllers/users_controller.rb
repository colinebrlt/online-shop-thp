class UsersController < ApplicationController
  before_action :check_user
  before_action :set_cart
  before_action :authenticate_user!           , except: [:create]
  before_action :redirect_user_if_not_author  , only: [:show, :edit, :update, :destroy]

  def show
    @orders = current_user.orders
  end 

  def create
    Cart.create(user_id: @user.id)
  end 

  def edit
  end 

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), success: "Vos informations ont bien été mises à jour"
    else
      render :edit
    end
  end 

  def destroy
    @user.destroy
    redirect_to @user, success: "Votre profil a bien été supprimé"
  end 

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def check_user
    @user = User.find(current_user.id)
  end

  def redirect_user_if_not_author
    user = User.find(params[:id])
    unless current_user.id == user.id
      flash[:danger] = "Vous n'êtes pas le propriétaire de ce compte !!"
      redirect_back(fallback_location: root_path)
    end
  end

end
