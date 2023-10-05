FactoryBot.define do
  factory :candidate do
    title { Faker::Name.name }
    nomination factory: [:nomination]
  end
end
