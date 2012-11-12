# encoding: utf-8
class Photographers::SessionsController < Devise::SessionsController

  def create
    p = Photographer.where(email: params[:photographer][:email]).first

    if p
      if p.confirmed_at
        puts p.confirmed_at
      else
        flash[:notice] = "Seu cadastro ainda não está confirmado, quando confirmado enviaremos um email informando. Obrigado"
        redirect_to root_path
        return
      end
    end

    super
  end
end
