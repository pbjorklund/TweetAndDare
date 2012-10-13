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

end
