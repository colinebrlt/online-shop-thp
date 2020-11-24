class UsersController < ApplicationController
  before_action :check_user

  def show
    @user = User.find(params[:id])
    @user_orders = User.find(params[:id]).orders
  end 

  def edit
  end 

  def update
    if @user.update(user_params)
      redirect_to user_path, success: "Vos informations ont bien été mises à jour"
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
    @user = User.find(params[:id])
  end

end
