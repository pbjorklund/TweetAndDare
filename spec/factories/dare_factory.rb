FactoryGirl.define do
  sequence :dare_target do |n|
    "@pbjorklund#{n}"
  end

  factory :dare do
    text 'run Stockholm marathon'
    target { generate(:dare_target) }
  end

  factory :dare_params, class: Hash do
    text 'run Stockholm marathon'
    target { generate(:dare_target) }
  end
end
