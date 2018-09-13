FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@bar.com" }
    password { "secret123" }
    password_confirmation "secret123"
    confirmed_at Time.now
    after(&:confirm!)
  end
end
