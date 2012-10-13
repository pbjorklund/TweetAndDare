require 'spec_helper'
require 'ostruct'

describe User do
  before(:each) do
  end

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

  describe "#self.create_from_omniauth" do
    it "creates a user given a valid auth" do
      Auth.stub(:new).and_return(nil)
      expect { User.create_from_omniauth omniauth }.to change{User.count}.by(1)
    end
  end
end
