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
    @photo = Photo.create(params[:photo])
    count = @photo.album.photos.size
    @photo.name = @photo.album.date.strftime("%d_%m_%Y") + @photo.album.beach + "_" + count.to_s

    @photo.save

    @photo
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
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
  end


  def find_photos
  end

  def find_result
    @photos = []

    if !params[:album_id].empty?
      @photos = Album.find(params[:album_id]).photos
    elsif !params[:find_by_keyword].empty?
      Album.where("lower(beach) like lower('%#{params[:find_by_keyword]}%')").each do |a|
        @photos.concat a.photos
      end
    elsif !params[:find_by_date].empty?
      date_str = params[:find_by_date].gsub('/', '_')
      @photos = Photo.where("lower(name) like lower('%#{date_str}%')")
    else
      flash[:notice] = "Pesquise por Data ou Palavra-chave"
      redirect_to find_photos_path
      return
    end

    if(@photos == [])
      flash[:notice] = "Nenhuma foto encontrada."
      redirect_to find_photos_path
    end
    
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    session[:return_to] ||= request.referer
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to session[:return_to] }
      format.json { head :no_content }
    end
  end
end
