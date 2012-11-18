require 'spec_helper'

describe Conversation do
  let (:user)           { Fabricate.build(:user) }
  let (:recipient)      { Fabricate.build(:user) }

  describe "create" do
    it "can create a new conversation" do
      Conversation.create!(user: user, recipient: recipient)
    end

    it "set the new conversation to 'unread'" do
      conversation = Conversation.create!(user: user, recipient: recipient)
      conversation.read.should == false
    end

    it "should not create a conversation without an user" do
      begin
        Conversation.create(recipient: recipient)
      rescue ActiveRecord::StatementInvalid
        true
      else
        false
      end
    end

    it "should not create a conversation without a recipient" do
      begin
        Conversation.create(user: user).should == nil
      rescue ActiveRecord::StatementInvalid
        true
      else
        false
      end
    end
  end
end
