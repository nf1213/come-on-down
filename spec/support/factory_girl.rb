require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    sequence(:username) {|n| "test#{n}user" }
    password 'password'
    password_confirmation 'password'
  end

  factory :prize do
    name "A new arbor!"
    price nil

    user
  end

  factory :bid do
    amount 675

    user
    prize
  end

end
