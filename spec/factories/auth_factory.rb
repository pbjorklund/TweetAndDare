FactoryGirl.define do

  sequence :auth_oauth_token
  sequence :auth_oauth_secret

  factory :auth do
    oauth_token      FactoryGirl.generate(:auth_oauth_token)
    oauth_token_secret     FactoryGirl.generate(:auth_oauth_secret)
  end
end
