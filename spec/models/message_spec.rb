require 'spec_helper'

describe Message do
  let (:user)           { Fabricate(:user) }
  let (:conversation)   { Fabricate(:conversation) }

  describe "create" do
    it "can create a new message" do
      Message.create!(user: user, conversation: conversation)
    end

    it "should not create a message without a user" do
      begin
        Message.create(conversation: conversation)
      rescue ActiveRecord::StatementInvalid
        true
      else
        false
      end
    end
    
    it "should not create a message without a conversation" do
      begin
        Message.create(user: user)
      rescue ActiveRecord::StatementInvalid
        true
      else
        false
      end
    end
  end

  describe "create_with_conversations" do
    let (:recipient)    { Fabricate(:user) }

    it "create conversations for both side" do
      Message.create_with_conversations({body: "lol"}, user, recipient)

      user_conversation = Conversation.all[-2]
      user_conversation.user.should == user
      user_conversation.recipient.should == recipient
      user_conversation.messages.first.body.should == "lol"
      user_conversation.messages.first.user.should == user

      recipient_conversation = Conversation.all[-1]
      recipient_conversation.user.should == recipient
      recipient_conversation.recipient.should == user
      recipient_conversation.messages.first.body.should == "lol"
      recipient_conversation.messages.first.user.should == user
    end

    it "should not recreate conversations if they already exist" do
      Message.create_with_conversations({body: "lol"}, user, recipient)
      user_conversation = Conversation.all[-2]
      recipient_conversation = Conversation.all[-1]

      Message.create_with_conversations({body: "lol"}, user, recipient)
      user_conversation.should == Conversation.all[-2]
      recipient_conversation.should == Conversation.all[-1]
    end

    it "should re-set the conversation to unread" do
      Message.create_with_conversations({body: "lol"}, user, recipient)
      Conversation.all[-2].read!
      Conversation.all[-1].read!

      Message.create_with_conversations({body: "lol"}, user, recipient)
      Conversation.all[-2].read.should == false
      Conversation.all[-1].read.should == false
    end
  end
end
