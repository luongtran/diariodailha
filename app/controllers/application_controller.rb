class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :create_basket

  def create_basket
    if session[:basket] == nil
      session[:basket] = Sale.new
    end
  end

  def basket
    session[:basket]
  end

  def basket=(basket)
    session[:basket] = basket
  end  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
end
