# encoding:utf-8
class Photographers::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)

    DefaultMailer.alert_admin.deliver
    DefaultMailer.alert_photographer(resource).deliver

    sign_out resource

    flash[:notice] = "Você receberá um email, assim que seu cadastro estiver ativo"
    root_path
  end

end
