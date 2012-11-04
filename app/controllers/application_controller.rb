class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :create_basket

  def create_basket
    if session[:basket] == nil
      session[:basket] = Sale.new
      if user_signed_in?
        basket.user_id = current_user.id
      end
    end
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
end
