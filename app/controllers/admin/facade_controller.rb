class Admin::FacadeController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :authenticate_user!
  before_action :check_if_user_admin

  def index
  end

  def check_if_user_admin
    unless current_user.is_admin
      redirect_to root_path, danger: "Vous n'êtes pas administrateur de ce site !"
    end
  end
end