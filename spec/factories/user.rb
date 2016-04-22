FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@getrecall.co"
  end

  factory :user do
    email

    trait :admin do
      role :admin
    end
  end
end
