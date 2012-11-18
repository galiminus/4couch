class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_user, :load_recipient

  def index
    respond_to do |format|
      format.html { redirect_to user_conversation_path @user, @user.conversations.first }
      format.json { render json: @conversations }
    end
  end

  def show
    @conversation =
      Conversation.where(user_id: @user, recipient_id: @recipient).first_or_initialize
    @conversation.read!

    @message = Message.new(conversation: @conversation)

    respond_to do |format|
      format.html
      format.json { render json: @conversation }
    end
  end

  protected

  def load_user
    @user = User.find(params[:user_id])
  end

  def load_recipient
    if params[:recipient_id].present?
      @recipient = User.find(params[:recipient_id])
    end
  end
end
