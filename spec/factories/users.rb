FactoryGirl.define do
  factory :user do
    first_name "Joe"
    last_name "Doe"
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
  end
end