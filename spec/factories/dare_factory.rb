FactoryGirl.define do
  sequence :dare_nickname do |n|
    "pbjorklund#{n}"
  end

  factory :dare do
    text 'run Stockholm marathon'
    daree { FactoryGirl.generate(:dare_nickname) }
  end
end
