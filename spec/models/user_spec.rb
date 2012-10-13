require 'spec_helper'
require 'ostruct'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  let(:omniauth) do
    oa = OpenStruct.new
    oa.uid = "1"

    info = OpenStruct.new
    info.nickname = "pbjorklund"

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

  describe "#self.create_from_omniauth" do
    it "creates a user given a valid auth" do
      Auth.stub(:new).and_return(nil)
      expect { User.create_from_omniauth omniauth }.to change{User.count}.by(1)
    end
  end
end
