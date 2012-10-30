class PhotoListsController < ApplicationController
  # GET /photo_lists
  # GET /photo_lists.json
  def index
    @photo_lists = PhotoList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photo_lists }
    end
  end

  # GET /photo_lists/1
  # GET /photo_lists/1.json
  def show
    @photo_list = PhotoList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo_list }
    end
  end

  # GET /photo_lists/new
  # GET /photo_lists/new.json
  def new
    @photo_list = PhotoList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo_list }
    end
  end

  # GET /photo_lists/1/edit
  def edit
    @photo_list = PhotoList.find(params[:id])
  end

  # POST /photo_lists
  # POST /photo_lists.json
  def create
    @photo_list = PhotoList.new(params[:photo_list])

    respond_to do |format|
      if @photo_list.save
        format.html { redirect_to @photo_list, notice: 'Photo list was successfully created.' }
        format.json { render json: @photo_list, status: :created, location: @photo_list }
      else
        format.html { render action: "new" }
        format.json { render json: @photo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photo_lists/1
  # PUT /photo_lists/1.json
  def update
    @photo_list = PhotoList.find(params[:id])

    respond_to do |format|
      if @photo_list.update_attributes(params[:photo_list])
        format.html { redirect_to @photo_list, notice: 'Photo list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_lists/1
  # DELETE /photo_lists/1.json
  def destroy
    @photo_list = PhotoList.find(params[:id])
    @photo_list.destroy

    respond_to do |format|
      format.html { redirect_to photo_lists_url }
      format.json { head :no_content }
    end
  end
end
