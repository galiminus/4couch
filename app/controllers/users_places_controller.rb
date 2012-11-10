class UsersPlacesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_user

  def index
    @lat = params[:lat].to_f
    @lng = params[:lng].to_f
    @places = Place.all.to_gmaps4rails do |place, marker|
      marker.json({id: place.id, link: place_path(place)})
      marker.title place.title
    end

    respond_to do |format|
      format.html
      format.json { render json: @places }
    end
  end

  def show
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @place }
    end
  end

  def new
    @place = Place.new

    respond_to do |format|
      format.html
      format.json { render json: @place }
    end
  end

  def edit
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @place }
    end
  end

  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render json: @place, status: :created, location: @place }
      else
        format.html { render action: "new" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end

  protected

  def load_user
    @user = User.find(params[:user_id])
  end
end

