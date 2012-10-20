class UsersCommunitiesController < ApplicationController
  before_filter :load_user

  def index
    @user = User.find(params[:user_id])
    @communities = @user.communities
  end

  protected

  def load_user
    @user = User.find(params[:user_id])
  end
end

