class WorkWithUsController < ApplicationController
  # GET /work_with_us
  # GET /work_with_us.json


  def index
    @work_with_us = WorkWithU.all

    authorize! :manage, WorkWithU

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_with_us }
    end
  end

  # GET /work_with_us/1
  # GET /work_with_us/1.json
  def show
    @work_with_u = WorkWithU.find(params[:id])

    authorize! :manage, @work_with_u

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_with_u }
    end
  end

  # GET /work_with_us/new
  # GET /work_with_us/new.json
  def new
    @work_with_u = WorkWithU.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_with_u }
    end
  end

  # GET /work_with_us/1/edit
  def edit
    @work_with_u = WorkWithU.find(params[:id])
    authorize! :manage, @work_with_u
  end

  # POST /work_with_us
  # POST /work_with_us.json
  def create
    @work_with_u = WorkWithU.new(params[:work_with_u])

    respond_to do |format|
      if @work_with_u.save
        format.html { redirect_to root_path, notice: 'Curriculum enviado com sucesso!' }
        #format.json { render json: @work_with_u, status: :created, location: @work_with_u }
      else
        format.html { render action: "new" }
        #format.json { render json: @work_with_u.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_with_us/1
  # PUT /work_with_us/1.json
  def update
    @work_with_u = WorkWithU.find(params[:id])
    
    authorize! :manage, @work_with_u

    respond_to do |format|
      if @work_with_u.update_attributes(params[:work_with_u])
        format.html { redirect_to @work_with_u, notice: 'Work with u was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_with_u.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_with_us/1
  # DELETE /work_with_us/1.json
  def destroy
    @work_with_u = WorkWithU.find(params[:id])

    authorize! :manage, @work_with_u
    
    @work_with_u.destroy

    respond_to do |format|
      format.html { redirect_to work_with_us_url }
      format.json { head :no_content }
    end
  end
end
