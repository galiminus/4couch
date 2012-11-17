class MessagesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    recipient = User.find(params[:recipient_id])

    respond_to do |format|
      if Message.create_with_conversations(params[:message], user, recipient)
        format.html { redirect_to user_conversations_path(user) }
      else

      end
    end
  end
end
