# encoding: utf-8
class SalesController < ApplicationController
  # GET /sales
  # GET /sales.json

  before_filter :authenticate_user!, :except => [:add_photo]
  def index
    @sales = Sale.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.json
  def new
    @sale = Sale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(params[:sale])

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render json: @sale, status: :created, location: @sale }
      else
        format.html { render action: "new" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.json
  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :no_content }
    end
  end

  def add_photo

    if (user_signed_in?)
      if (session[:basket] == nil)
        session[:basket] = []
      end

      add_to_basket(params[:photo_id])
    end 

    respond_to do |format|
      format.js
    end
  end

  def finish_sale

    if (session[:basket] != nil)
      @sale = Sale.new
      @sale.date = Time.now
      @sale.user = current_user
      
      session[:basket].each do |b|
        sale_item = SaleItem.new
        sale_item.sale = @sale
        sale_item.photo = Photo.find(b)
        sale_item.date = Time.now

        sale_item.save
      end

      session[:basket] = nil
      @sale.save

      DefaultMailer.finish_sale(@sale).deliver
      flash[:notice] = "Venda finalizada com sucesso! Você receberá um email com informações sobre como proceder"
      redirect_to root_path
    else
      redirect_to find_photos_path, :notice => "Venda Finalizada"
    end

  end
end
