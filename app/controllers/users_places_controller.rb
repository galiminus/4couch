class UsersPlacesController < ApplicationController
  before_filter :load_user

  def index
    @user = User.find(params[:user_id])
    @places = @user.places
  end

  protected

  def load_user
    @user = User.find(params[:user_id])
  end
end

