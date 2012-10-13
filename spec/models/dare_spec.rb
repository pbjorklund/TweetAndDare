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

  it "requires a text" do
    dare.text = ""
    dare.should be_invalid
  end

  describe "#as_tweet" do
    it { dare.as_tweet.should be_a(String) }
    it { dare.as_tweet.should eq('I #dare #anyone to run Stockholm marathon http://some.url.com/dares/12345') }
    it { dare.as_tweet.should match('#anyone') }
    it { dare.as_tweet.should match('run Stockholm marathon') }
    it { dare.as_tweet.should match(/http(s)?\:\/\/([a-z0-9\-\_]*)\.[a-z0-9\-\_]*\.[a-z0-9\-\_]{2,5}(\/(.*)?)?/i) }
  end
end
