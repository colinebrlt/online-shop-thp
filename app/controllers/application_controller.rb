class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger, :error, :notice, :alert
  include ApplicationHelper
  include CurrentCart

  def redirect_if_user_not_admin
    unless current_user.is_admin
      redirect_to root_path, danger: "Vous n'êtes pas administrateur de ce site !"
    end
  end
end
