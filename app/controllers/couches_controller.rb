class CouchesController < ApplicationController
  before_filter :authenticate_user!

  # GET /couches
  # GET /couches.json
  def index
    @lat = params[:lat].to_f
    @lng = params[:lng].to_f
    @couches = Couch.all.to_gmaps4rails do |couch, marker|
      marker.json({id: couch.id, link: couch_path(couch)})
      marker.title couch.title
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @couches }
    end
  end

  # GET /couches/1
  # GET /couches/1.json
  def show
    @couch = Couch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @couch }
    end
  end

  # GET /couches/new
  # GET /couches/new.json
  def new
    @couch = Couch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @couch }
    end
  end

  # GET /couches/1/edit
  def edit
    @couch = Couch.find(params[:id])
  end

  # POST /couches
  # POST /couches.json
  def create
    @couch = Couch.new(params[:couch])

    respond_to do |format|
      if @couch.save
        format.html { redirect_to @couch, notice: 'Couch was successfully created.' }
        format.json { render json: @couch, status: :created, location: @couch }
      else
        format.html { render action: "new" }
        format.json { render json: @couch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /couches/1
  # PUT /couches/1.json
  def update
    @couch = Couch.find(params[:id])

    respond_to do |format|
      if @couch.update_attributes(params[:couch])
        format.html { redirect_to @couch, notice: 'Couch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @couch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /couches/1
  # DELETE /couches/1.json
  def destroy
    @couch = Couch.find(params[:id])
    @couch.destroy

    respond_to do |format|
      format.html { redirect_to couches_url }
      format.json { head :no_content }
    end
  end
end
