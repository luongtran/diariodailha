# encoding: utf-8
class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    authorize! :manage, :all

    @messages = Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    authorize! :manage, :all
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    authorize! :manage, :all
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    authorize! :manage, :all
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    authorize! :manage, :all
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    authorize! :manage, :all
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  def contrast_message
    authorize! :manage, :all

    Message.where(contrast: true).each do |m| 
      puts m.title
      m.contrast = false
      m.save()
    end

    message = Message.find(params[:message_id])
    message.contrast = true;
    puts message.title
    if (message.save())
      @status = "Notícia destacada com sucesso"
    else
      @status = "Não foi possível destacar notícia, tente novamente"
    end

    respond_to do |format|
      format.js 
    end
  end
end
