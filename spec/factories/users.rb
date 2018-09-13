FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@bar.com" }
    password { "secret123" }
    after(&:confirm!)
  end
end
