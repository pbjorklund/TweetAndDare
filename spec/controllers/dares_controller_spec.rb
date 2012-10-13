require 'spec_helper'

describe DaresController do
  before(:each) do
    User.delete_all
  end

    describe "#index" do
      it "exists" do
        get 'index'
        response.should be_success
      end
    end

    describe '#create' do
      it 'creates dares' do
        post 'create', { dare: FactoryGirl.attributes_for(:dare) }
        response.should be_successful
      end

    end

    describe '#show' do

      before(:each) do
      end

      it 'is accessible' do
        d = FactoryGirl.create(:dare)
        get 'show', { id: d.id }
        response.should be_successful
      end
    end
end
