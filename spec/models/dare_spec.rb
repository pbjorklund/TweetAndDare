#encoding: utf-8

require 'spec_helper'

describe Dare do
  before(:each) do
    User.destroy_all
  end

  let(:dare) { FactoryGirl.create(:dare) }

  it "requires a text" do
    dare.text = ""
    dare.should be_invalid
  end

  describe "#target" do
    it "must start with a @ handle or # tag" do
      build(:dare, target: nil).should be_valid
      build(:dare, target: 'invalid').should_not be_valid
      build(:dare, target: '@handle').should be_valid
      build(:dare, target: '#tag').should be_valid
    end
    context "when it contains a @ handle" do
      before(:each) do
        dare.dared_user = nil
        dare.target = "@createdFromTarget"
      end
      it "finds or creates a user" do
        dare.dared_user.nickname.should eq("createdFromTarget")
      end
    end
    context "when it contains a # tag" do
      before(:each) do
        dare.dared_user = nil
        dare.target = "#targethash"
      end
      it "does not create a user" do
        dare.dared_user.should be_nil
      end
    end
  end

  describe "#as_tweet" do
    context "when no dared user" do
      before(:each) do
        dare.dared_user = nil
      end
      it { dare.as_tweet.should be_a(String) }
      it { dare.as_tweet.should eq("I #dare #anyone to run Stockholm marathon http://satsun.r12.railsrumble.com/dares/#{dare.id}") }
      it { dare.as_tweet.should match('#anyone') }
      it { dare.as_tweet.should match('run Stockholm marathon') }
      it { dare.as_tweet.should match(/http(s)?\:\/\/([a-z0-9\-\_]*)\.[a-z0-9\-\_]*\.[a-z0-9\-\_]{2,5}(\/(.*)?)?/i) }
    end

    context "when a dared user" do
      it { dare.as_tweet.should be_a(String) }
      it { dare.as_tweet.should eq("I #dare @#{dare.dared_user.nickname} to run Stockholm marathon http://satsun.r12.railsrumble.com/dares/#{dare.id}") }
      it { dare.as_tweet.should match('run Stockholm marathon') }
      it { dare.as_tweet.should match(/http(s)?\:\/\/([a-z0-9\-\_]*)\.[a-z0-9\-\_]*\.[a-z0-9\-\_]{2,5}(\/(.*)?)?/i) }
    end
  end
end
