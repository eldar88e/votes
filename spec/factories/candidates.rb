FactoryBot.define do
  factory :candidate do
    title { Faker::Name.name }
    nomination factory: [:nomination]
    description { Faker::Lorem.sentence }
  end
end
