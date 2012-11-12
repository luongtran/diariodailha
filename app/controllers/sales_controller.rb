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
        session[:basket] = {}
      end

      add_to_basket(params[:photo_id])
    end 

    respond_to do |format|
      format.js
    end
  end

  def finish_sale

    if basket
      if basket.empty?
        redirect_to find_photos_path, flash[:notice] = "Carrinho de compras vazio!"
      end
    end

    sale = Sale.new

    basket.each do |key, value|
      
      digital = params["digital" + key.to_s]
      if digital.to_i > 0
        sale_item_digital = SaleItem.new
        sale_item_digital.type = "Digital"
        sale_item_digital.quantity = digital.to_i
        sale_item_digital.sale = sale
        sale_item_digital.photo = Photo.find(key)
        sale_item_digital.date = Time.now

        puts sale_item_digital
      end

      small = params["small" + key.to_s]
      if small.to_i > 0
        sale_item_small = SaleItem.new
        sale_item_small.type = "Física Pequena"
        sale_item_small.quantity = small.to_i
        sale_item_small.sale = sale
        sale_item_small.photo = Photo.find(key)
        sale_item_small.date = Time.now

        puts sale_item_small
      end

      medium = params["medium" + key.to_s]
      if medium.to_i > 0
        sale_item_medium = SaleItem.new
        sale_item_medium.type = "Física Média"
        sale_item_medium.quantity = medium.to_i
        sale_item_medium.sale = sale
        sale_item_medium.photo = Photo.find(key)
        sale_item_medium.date = Time.now

        puts sale_item_medium
      end

      big = params["big" + key.to_s]
      if big.to_i > 0
        sale_item_big = SaleItem.new
        sale_item_big.type = "Física Grande"
        sale_item_big.quantity = big.to_i
        sale_item_big.sale = sale
        sale_item_big.photo = Photo.find(key)
        sale_item_big.date = Time.now

        puts sale_item_big
      end
    end

    session[:basket] = nil
    @sale.save

    DefaultMailer.finish_sale(@sale).deliver
    flash[:notice] = "Venda finalizada com sucesso! Você receberá um email com informações sobre como proceder"
    redirect_to root_path
    redirect_to sale_view_sale_path


  end

  def view_sale
    if basket
      if basket.empty?
        redirect_to find_photos_path, flash[:notice] = "Carrinho de compras vazio!"
        return
      end
    end
  end
end
