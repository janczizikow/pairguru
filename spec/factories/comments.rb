FactoryBot.define do
  factory :comment do
    user nil
    movie nil
    rating 1
    content "MyText"
  end
end
