FactoryBot.define do
  factory :comment do
    user
    movie
    rating { Faker::Number.between(1, 5) }
    content { Faker::Lorem.sentence(3, true) }
  end
end
