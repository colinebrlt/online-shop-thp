class Admin::FacadeController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :authenticate_user!
  before_action :redirect_if_user_not_admin

  def index
  end
end