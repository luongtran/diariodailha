module ApplicationHelper
  def basket
    session[:basket]
  end

  def basket=(basket)
    session[:basket] = basket
  end
end
