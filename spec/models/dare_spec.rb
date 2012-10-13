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

    it 'returns a string' do
      dare.as_tweet.should be_a(String)
    end

    it 'is specifically' do
      dare.as_tweet.should eq('I #dare #anyone to run Stockholm marathon http://some.url.com/dares/12345')
    end

    it 'contains the daree nickname' do
      dare.as_tweet.should match('#anyone')
    end

    it 'contains the dare text' do
      dare.as_tweet.should match('run Stockholm marathon')
    end

    it 'contains a url' do
      dare.as_tweet.should match(/http(s)?\:\/\/([a-z0-9\-\_]*)\.[a-z0-9\-\_]*\.[a-z0-9\-\_]{2,5}(\/(.*)?)?/i)
    end

  end

end
