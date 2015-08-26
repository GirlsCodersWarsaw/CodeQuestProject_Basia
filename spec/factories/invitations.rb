FactoryGirl.define do
  factory :invitation do
    accepted false
    sender { create :user }
    recipient_email { Faker::Internet.email }
  end
end