class UsersCouchesController < ApplicationController
  before_filter :load_user

  def index
    @user = User.find(params[:user_id])
    @couches = @user.couches
  end

  protected

  def load_user
    @user = User.find(params[:user_id])
  end
end

