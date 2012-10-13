require 'spec_helper'

describe Auth do

  let(:auth) { FactoryGirl.build :auth }

  it "requires an oauth token" do
    auth.oauth_token = ""
    auth.should be_invalid
  end

  it "requires an oauth token secret" do
    auth.oauth_token_secret = ""
    auth.should be_invalid
  end
end
