FactoryGirl.define do
  pw = Faker::Internet.password

  factory :user do
    sequence(:email){|n| "wolfie.truong@gmail.com" }
    password pw
    password_confirmation = pw
    confirmed_at Time.now
  end
end
