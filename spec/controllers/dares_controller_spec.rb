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
      it 'creates dares when signed in' do
        controller.stub(:current_user).and_return(FactoryGirl.create(:user))
        post 'create', dare: FactoryGirl.attributes_for(:dare_params)
        response.should be_redirect
      end

      it 'creates dares after signing in' do
        post 'create', dare: FactoryGirl.attributes_for(:dare_params)
        response.should be_redirect
      end
    end

    describe '#show' do
      it 'is accessible' do
        d = FactoryGirl.create(:dare)
        get 'show', { id: d.id }
        response.should be_successful
      end
    end
end
