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
    nickname   { FactoryGirl.generate(:nickname) }
    association :auth, oauth_token_secret: FactoryGirl.generate(:oauth_secret), oauth_token: FactoryGirl.generate(:oauth_token)
  end

  factory :pbjorklund, :class => User do
    id         19505451
    name       "Patrik Bjorklund"
    bio        "Rocking and rolling"
    image_url  "http//www.twitter.com/image.jpg"
    nickname   "pbjorklund"
    association :auth, oauth_token_secret: FactoryGirl.generate(:oauth_secret), oauth_token: FactoryGirl.generate(:oauth_token)
  end
end
