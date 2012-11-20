# encoding: utf-8
class ContentsController < ApplicationController
  # GET /contents
  # GET /contents.json

  before_filter :authenticate_user!, :except => [:show]
  
  def index
    @contents = Content.all
    
    authorize! :manage, Content    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @content = Content.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/new
  # GET /contents/new.json
  def new
    @content = Content.new
    
    authorize! :manage, Content

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
    
    authorize! :manage, Content
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(params[:content])

    authorize! :manage, Content
    
    respond_to do |format|
      if @content.save
        format.html { redirect_to contents_url, notice: 'Conteúdo criado com sucesso' }
        format.json { render json: contents_url, status: :created, location: @content }
      else
        format.html { render action: "new" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contents/1
  # PUT /contents/1.json
  def update
    @content = Content.find(params[:id])

    authorize! :manage, Content
    
    respond_to do |format|
      if @content.update_attributes(params[:content])
        format.html { redirect_to contents_url, notice: 'Conteúdo editado com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content = Content.find(params[:id])

    authorize! :manage, Content

    @content.destroy
    
    respond_to do |format|
      format.html { redirect_to contents_url }
      format.json { head :no_content }
    end
  end
end
