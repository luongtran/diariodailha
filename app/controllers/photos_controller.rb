# encoding:utf-8
class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
#  def index
#    @photos = Photo.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @photos }
#    end
#  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end


  # # GET /photos/1/edit
  # def edit
  #   @photo = Photo.find(params[:id])
  # end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new
    @album = Album.find(params[:photo][:album_id])

    count = 1
    @photo.name = @album.date.strftime("%d_%m_%Y") + @album.beach + "_" + count.to_s
    @photo.album_id = params[:photo][:album_id]
    @photo.pic = params[:photo][:pic]

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @album, notice: 'Photo was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { redirect_to album_add_photo_path(@album), notice: 'Arquivo inválido'}
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
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

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
end
