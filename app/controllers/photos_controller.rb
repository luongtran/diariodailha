# encoding:utf-8
class PhotosController < ApplicationController

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end



  # POST /photos
  # POST /photos.json
  def create

    if photographer_signed_in?
      album = Album.find(params[:photo][:album_id])
      if album.photographer != current_photographer
        flash[:error] = "Você não tem permissão para adicionar fotos a esse álbum"
      else
        @photo = Photo.create(params[:photo])
        count = @photo.album.photos.size
        @photo.name = @photo.album.date.strftime("%d_%m_%Y") + @photo.album.beach + "_" + count.to_s

        @photo.save

        @photo
      end
    else
      flash.notice = "Faça login antes de prosseguir!"
      redirect_to new_photographer_session_path
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    if photographer_signed_in?
      @photo = Photo.find(params[:id])

      respond_to do |format|
        if @photo.update_attributes(params[:photo])
          format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @photo.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.notice = "Faça login antes de prosseguir!"
      redirect_to new_photographer_session_path
    end
  end


  def find_photos
  end

  def find_albums
    @albums = []

    if !params[:find_by_keyword].empty?
      @albums = Album.where("lower(name) like lower('%#{params[:find_by_keyword]}%')")
    elsif !params[:find_by_date].empty?
      date_str = params[:find_by_date].gsub('/', '_')
      @albums = Album.where("lower(date) like lower('%#{date_str}%')")
    else
      flash[:notice] = "Pesquise por Data ou Palavra-chave"
      redirect_to find_photos_path
      return
    end

    if(@albums == [])
      flash[:notice] = "Nenhum álbum encontrado."
      redirect_to find_photos_path
    end
  end

  def find_result
    @photos = []

    @photos = Album.find(params[:album_id]).photos
   
    
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy

    if photographer_signed_in?
      session[:return_to] ||= request.referer
      @photo = Photo.find(params[:id])

      if @photo.album.photographer != current_photographer
        respond_to do |format|
          flash[:error] = "Você não tem permissão para adicionar fotos a esse álbum"
          format.html { redirect_to root_path }
        end      
      end
      @photo.destroy

      respond_to do |format|
        format.html { redirect_to photographer_show_albums_path }
        format.json { head :no_content }
      end

    elsif user_signed_in? && current_user.is_admin?
      session[:return_to] ||= request.referer
      @photo = Photo.find(params[:id])

      album_id = @photo.album_id

      @photo.destroy
    
      respond_to do |format|
        format.html { redirect_to album_show_photos_path(album_id) }
        format.json { head :no_content }
      end
    else
      flash.notice = "Faça login antes de prosseguir!"
      redirect_to new_photographer_session_path
    end
  end

end
