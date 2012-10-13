require 'spec_helper'

describe DaresController do

    describe "#index" do
      it "exists" do
        get 'index'
        response.should be_success
      end
    end

    describe '#create' do
      it 'is accessible' do
        post 'create', FactoryGirl.attributes_for(:dare)
        response.should be_successful
      end

    end

    describe '#show' do

      before(:each) do
        FactoryGirl.create(:dare)
      end

      it 'is accessible' do
        get 'show', { id: 1 }
        response.should be_successful
      end
    end
end
