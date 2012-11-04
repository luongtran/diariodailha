module ApplicationHelper
  def basket
    session[:basket]
  end

  def basket=(basket)
    session[:basket] = basket
  end

  def add_to_basket(photo_id)
    session[:basket] << photo_id
  end
  
end
