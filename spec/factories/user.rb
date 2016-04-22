FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@getrecall.co"
  end

  factory :user do
    email
  end
end
