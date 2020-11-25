class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger, :error, :notice, :alert
  include ApplicationHelper
  include CurrentCart
end
