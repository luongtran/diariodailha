# encoding: utf-8
class NewsPhotosController < ApplicationController

  def create
    authorize! :manage, :all
    @news_photo = NewsPhoto.create(params[:news_photo])

    @news_photo.save
  end

  def index
  end

  def view_photos
    @news_photos = Message.find(params[:message_id]).news_photos
  end

  def edit
    authorize! :manage, :all
    @news_photo = NewsPhoto.find(params[:id])
  end

  def update
    authorize! :manage, :all
    @news_photo = NewsPhoto.find(params[:id])

    @news_photo.legend = params[:news_photo][:legend]

    @news_photo.save

    flash[:success] = "Sucesso ao salvar legenda"
    redirect_to message_view_photos_path(@news_photo.message_id)
  end

  def destroy
    authorize! :manage, :all
    session[:return_to] ||= request.referer
    
    @news_photo = NewsPhoto.find(params[:id])

    message_id = @news_photo.message_id
    
    @news_photo.destroy

    respond_to do |format|
      flash[:alert] = "Foto excluída com sucesso"
      format.html { redirect_to message_view_photos_path(message_id) }
      format.json { head :no_content }
    end
  end

  def upload_images
    authorize! :manage, :all
    @message = Message.find(params[:message_id])
  end
end
