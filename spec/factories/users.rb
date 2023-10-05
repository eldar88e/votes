FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123456' }
    phone { rand(79_780_000_000..79_789_999_999) }
    status { true }
  end
end
