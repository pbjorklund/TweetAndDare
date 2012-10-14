FactoryGirl.define do
  sequence :id do |n|
    "12345#{n}"
  end

  sequence :nickname do |n|
    "pbjorklund#{n}"
  end

  sequence :oauth_secret
  sequence :oauth_token

  factory :user do
    uid         { FactoryGirl.generate(:id) }
    nickname    { FactoryGirl.generate(:nickname) }
    image       "https://twimg0-a.akamaihd.net/profile_images/2243520267/Zeeraw.png"
    association :auth, oauth_token_secret: FactoryGirl.generate(:oauth_secret), oauth_token: FactoryGirl.generate(:oauth_token)
  end
end
