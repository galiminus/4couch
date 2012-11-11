class UsersPlacesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_user

  def show
    @place = @user.place

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
    @place = @user.place

    respond_to do |format|
      format.html
      format.json { render json: @place }
    end
  end

  def create
    @place = Place.new(params[:place])
    @place.user_id = @user.id

    respond_to do |format|
      if @place.save
        format.html { redirect_to user_place_path(@user), notice: 'Place was successfully created.' }
        format.json { render json: @place, status: :created, location: user_place_path(@user) }
      else
        format.html { render action: "new" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @place = @user.place

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to user_place_path(@user), notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place = @user.place
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

