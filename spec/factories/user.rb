FactoryGirl.define do
  pw = Faker::Internet.password

  factory :user do
    sequence(:email){|n| "person{n}@example.com" }
    password pw
    passwrod_confirmation = pw
    confirmed_at Time.now
  end
end
