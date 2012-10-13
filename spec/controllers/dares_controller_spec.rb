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

        post 'create', { dare: { text: 'run Stockholm marathon', daree: { nickname: '@Zeeraw' } } }
        response.should be_successful

      end

    end

    describe '#show' do

      it 'is accessible' do
        get 'show', { id: 1 }
        response.should be_successful
      end

    end


end
