class SiteController < ApplicationController


  def index
  end

  def terms
  end

  def about
  end

  def admin_page
    authorize! :manage, :all
  end

  def work_with_us
  end

  def advertise
  end

  def how_to_buy_photos
  end
end
