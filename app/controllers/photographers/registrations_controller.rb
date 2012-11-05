# encoding:utf-8
class Photographers::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    puts "resource"

    DefaultMailer.alert_admin.deliver

    root_path
  end

end
