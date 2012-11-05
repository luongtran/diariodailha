# encoding:utf-8
class PhotographersController < ApplicationController
  
  def authorize
    authorize! :manage, :all

    @photographer = Photographer.find(params[:id])

    @photographer.confirmed_at = Time.now

    respond_to do |format|
      if @photographer.save
        format.html { redirect_to photographers_path, notice: "Cadastro confirmado com sucesso"}
      else
        format.html { redirect_to photographers_path, notice: "Não foi possível confirmar cadastro"}
      end
    end
  end

  def deny
    authorize! :manage, :all

    @photographer = Photographer.find(params[:id])

    @photographer.destroy

    respond_to do |format|  
      format.html { redirect_to photographers_path, notice: "Fotógrafo excluido do cadstro"}
    end
  end

  def index
    authorize! :manage, :all
    @photographers = Photographer.all
  end

  def show_albums
    @albums = current_photographer.albums
  end
end
