FactoryGirl.define do
  factory :task do
    text 'Do a thing'
    due { Time.now + 3.days }

    user
  end
end
