require 'spec_helper'

describe ConversationsController do

  let(:user) { Fabricate(:user) }
  
  describe "GET index" do
    it "should redirect if not connected" do
      get :index, user_id: user.id
      response.should redirect_to(new_user_session_path)
    end
  end
end
