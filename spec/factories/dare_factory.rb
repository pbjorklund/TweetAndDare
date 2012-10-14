FactoryGirl.define do
  sequence :dare_nickname do |n|
    "pbjorklund#{n}"
  end

  factory :dare do
    text 'run Stockholm marathon'
    owner { FactoryGirl.create(:user) }
  end

  factory :dare_params, class: User do
    text 'run Stockholm marathon'
    owner({ nickname: FactoryGirl.generate(:dare_nickname) })
  end
end
