require 'spec_helper'
require 'ostruct'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  let(:omniauth) do
    oa = OpenStruct.new
    oa.uid = "1"

    info = OpenStruct.new
    info.nickname = "pbjorklund"
    info.image = "https://twimg0-a.akamaihd.net/profile_images/2243520267/Zeeraw.png"

    cred = OpenStruct.new
    cred.token = "token"
    cred.secret = "secret"

    oa.info = info
    oa.credentials = cred
    oa
  end

  it "must have a unique username" do
    user_attr = FactoryGirl.attributes_for(:user)
    lambda do
      2.times { User.create!(user_attr) }
    end.should raise_error
  end

  it "can fetch a #oauth_hash" do
    hash = user.oauth_hash
    hash[:oauth_token].should == 1
    hash[:oauth_token_secret].should == 1
    hash[:non].should be_nil
  end

  describe "#find_or_create" do
    it "creates a user if the nickname has not been used before" do
      expect { User.find_or_create!("find_or_create_test_user") }.to change{User.count}.by(1)
    end

    it "finds the user if the nickname has been used before" do
      expect { User.find_or_create!("find_or_create_test_user") }.to change{User.count}.by(0)
    end
  end

  describe "#self.create_or_find_from_omniauth" do
    it "creates or finds a user given a valid auth" do
      Auth.stub(:new).and_return(nil)
      expect { User.create_or_find_from_omniauth omniauth }.to change{User.count}.by(1)
    end

    it "updates changed credentials" do
      # TODO:
      # expect omniauth attributes to change when tokens have changed
    end
  end

  describe "#twitter_client" do
    it "does not raise any errors" do
      expect { user.twitter_client }.to_not raise_error
    end
  end

end
