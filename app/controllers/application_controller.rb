class ApplicationController < ActionController::Base
  protect_from_forgery

  def basket
    session[:basket]
  end

  def basket=(basket)
    session[:basket] = basket
  end  

  def add_to_basket(photo_id)
    session[:basket][photo_id] = "added"
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
end
