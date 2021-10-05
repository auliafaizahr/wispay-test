FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    user_id { User.first.id }
    category { Faker::Name.name }
    price { rand(2000...10000) }
    image { fixture_file_upload("public/sepeda.jpg", "image/jpeg") }
    is_active { true }
  end
end
