#encoding: utf-8

require 'spec_helper'

describe Dare do

  let(:dare) { build(:dare) }

  it "works" do
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
