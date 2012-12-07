#encoding: utf-8
class ContentsPhotosController < ApplicationController
  def create
    authorize! :manage, :all
    @contents_photo = ContentsPhoto.create(params[:contents_photo])

    @contents_photo.save
  end

  def index
  end

  def view_photos
    @contents_photos = Content.find(params[:content_id]).contents_photos
  end

  def edit
    authorize! :manage, :all
    @contents_photo = ContentsPhoto.find(params[:id])
  end

  def update
    authorize! :manage, :all
    @contents_photo = ContentsPhoto.find(params[:id])

    @contents_photo.legend = params[:contents_photo][:legend]

    @contents_photo.save

    flash[:success] = "Sucesso ao salvar legenda"
    redirect_to content_view_photos_path(@contents_photo.content_id)
  end

  def destroy
    authorize! :manage, :all
    session[:return_to] ||= request.referer
    
    @contents_photo = ContentsPhoto.find(params[:id])

    content_id = @contents_photo.content_id
    
    @contents_photo.destroy

    respond_to do |format|
      flash[:alert] = "Foto excluída com sucesso"
      format.html { redirect_to content_view_photos_path(content_id) }
      format.json { head :no_content }
    end
  end

  def upload_images
    authorize! :manage, :all
    @content = Content.find(params[:content_id])
  end
end
