# encoding: utf-8
class AlbumsController < ApplicationController
  # GET /albums
  # GET /albums.json

  #before_filter :authenticate_photographer!, :except => [:show_photos]

  def index
    if photographer_signed_in?
      @albums = Album.where(:photographer_id => current_photographer)

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @albums }
      end
    elsif user_signed_in? && current_user.is_admin?
      @albums = Album.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @albums }
      end
    else
      flash.notice = "Faça login antes de prosseguir!"
      redirect_to new_photographer_session_path
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    if photographer_signed_in?
      @album = Album.where(:id => params[:id], :photographer_id => current_photographer).first

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @album }
      end
    else
      flash.notice = "Faça login antes de prosseguir!"
      redirect_to new_photographer_session_path
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    if photographer_signed_in?
      @album = Album.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @album }
      end
    else
      flash.notice = "Faça login antes de prosseguir!"
      redirect_to new_photographer_session_path
    end
  end

  # GET /albums/1/edit
  def edit
    if photographer_signed_in?
      @album = Album.where(:id => params[:id], :photographer_id => current_photographer).first
      @album.date = @album.date.strftime('%d/%m/%Y')

    else
      flash.notice = "Faça login antes de prosseguir!"
      redirect_to new_photographer_session_path
    end
  end

  # POST /albums
  # POST /albums.json
  def create
    if photographer_signed_in?
      @album = Album.new(params[:album])

      @album.photographer = current_photographer

      respond_to do |format|
        if @album.save
          format.html { redirect_to @album, notice: 'Álbum criado com sucesso' }
          format.json { render json: @album, status: :created, location: @album }
        else
          format.html { render action: "new" }
          format.json { render json: @album.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.notice = "Faça login antes de prosseguir!"
      redirect_to new_photographer_session_path
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    if photographer_signed_in?
      @album = Album.find(params[:id])

      if (@album.photographer != current_photographer)
        respond_to do |format|
          flash[:error] = "Você não tem permissão para editar esse álbum"
          format.html { redirect_to root_path }
        end

        return
      end

      respond_to do |format|
        if @album.update_attributes(params[:album])
          format.html { redirect_to @album, notice: 'Album editado com sucesso.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @album.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.notice = "Faça login antes de prosseguir!"
      redirect_to new_photographer_session_path
    end
  end

  def show_photos

    @album = Album.find(params[:album_id])
    @photos = @album.photos
    @photos.sort! { |a, b| a.image.url.split("/")[a.image.url.split("/").count-1] <=> b.image.url.split("/")[b.image.url.split("/").count-1] }


    respond_to do |format|
      format.html
    end
  end



  def add_photo
    @photo = Photo.new
    @photo.album_id = params[:album_id]

    album = Album.find(params[:album_id])
    if (album.photographer != current_photographer)
      respond_to do |format|
        flash[:error] = "Você não tem permissão para adicionar fotos a esse álbum"
        format.html { redirect_to root_path }
      end

      return
    end

    respond_to do |format|
      format.html
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    if photographer_signed_in?
      @album = Album.find(params[:id])

      if (@album.photographer != current_photographer)
        respond_to do |format|
          flash[:error] = "Você não tem permissão para apagar esse álbum"
          format.html { redirect_to root_path }
        end
        return
      end

      @album.destroy

      respond_to do |format|
        format.html { redirect_to albums_url }
        format.json { head :no_content }
      end
    elsif user_signed_in? && current_user.is_admin?
      @album = Album.find(params[:id])

      @album.destroy

      respond_to do |format|
        format.html { redirect_to albums_url }
        format.json { head :no_content }
      end
    else
      flash.notice = "Faça login antes de prosseguir!"
      redirect_to new_photographer_session_path
    end
  end
end
