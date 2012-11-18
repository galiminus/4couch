class MessagesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    recipient = User.find(params[:recipient_id])

    Message.create_with_conversations(params[:message], user, recipient)

    respond_to do |format|
      format.html { redirect_to user_conversations_path(user) }
    end
  end
end
