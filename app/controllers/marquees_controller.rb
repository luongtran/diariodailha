class MarqueesController < ApplicationController
  # GET /marquees
  # GET /marquees.json
  # def index
  #   @marquees = Marquee.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @marquees }
  #   end
  # end

  # GET /marquees/1
  # GET /marquees/1.json
  def show
    authorize! :manage, :all
    @marquee = Marquee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marquee }
    end
  end

  # GET /marquees/new
  # GET /marquees/new.json
  def new
    authorize! :manage, :all
    @marquee = Marquee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marquee }
    end
  end

  # GET /marquees/1/edit
  def edit
    authorize! :manage, :all
    @marquee = Marquee.find(params[:id])
  end

  # POST /marquees
  # POST /marquees.json
  def create
    authorize! :manage, :all
    @marquee = Marquee.new(params[:marquee])

    respond_to do |format|
      if @marquee.save
        format.html { redirect_to @marquee, notice: 'Marquee was successfully created.' }
        format.json { render json: @marquee, status: :created, location: @marquee }
      else
        format.html { render action: "new" }
        format.json { render json: @marquee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /marquees/1
  # PUT /marquees/1.json
  def update
    authorize! :manage, :all
    @marquee = Marquee.find(params[:id])

    respond_to do |format|
      if @marquee.update_attributes(params[:marquee])
        format.html { redirect_to @marquee, notice: 'Marquee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @marquee.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /marquees/1
  # # DELETE /marquees/1.json
  # def destroy
  #   @marquee = Marquee.find(params[:id])
  #   @marquee.destroy

  #   respond_to do |format|
  #     format.html { redirect_to marquees_url }
  #     format.json { head :no_content }
  #   end
  # end
end
