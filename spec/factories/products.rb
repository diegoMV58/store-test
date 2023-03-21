FactoryBot.define do
  factory :product do
    external_id { Faker::Name.name }
    title { Faker::Name.name }
    description { Faker::Name.name }
    price { Faker::Number.number(digits: 7) }
    image { Faker::Avatar.image }
    rating { Faker::Number.number(digits: 5) }
    stock { Faker::Number.number(digits: 3) }
    category { Faker::Name.name }
    external_url { Faker::Internet.url(host: 'faker.com', path: '/produts') }
  end
end
