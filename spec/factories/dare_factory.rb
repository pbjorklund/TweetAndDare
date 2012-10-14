FactoryGirl.define do
  sequence :dare_nickname do |n|
    "pbjorklund#{n}"
  end

  factory :dare do
    text 'run Stockholm marathon'
    dared_user { FactoryGirl.create(:user) }
  end

  factory :dare_params, class: User do
    text 'run Stockholm marathon'
    dared_user({ nickname: FactoryGirl.generate(:dare_nickname) })
  end
end
