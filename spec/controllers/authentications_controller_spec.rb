require 'spec_helper'

describe AuthenticationsController do
  describe "POST 'create'" do
    before(:each) do
      controller.stub(:omniauth).and_return(mock.as_null_object)
    end

    context "successful signin"
    it "creates a user if env has omniauth.auth uid" do
      User.stub(:create_from_omniauth).and_return(FactoryGirl.build(:user))

      post 'create'

      flash[:notice].should == "You signed in"
      response.should redirect_to root_path
    end

    context "unsuccessful signin" do
      it "does not create a user if env has omniauth.auth uid" do
        User.stub(:create_from_omniauth).and_return(nil)

        post 'create'

        flash[:error].should == "User not found"
        response.should redirect_to root_path
      end
    end
  end
end
