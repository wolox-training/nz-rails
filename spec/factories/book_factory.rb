FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    title { Faker::Book.title }
    image { Faker::Internet.domain_name }
    publisher { Faker::Book.publisher }
    year { Faker::Number.between(1000, 2018).to_s }
  end
end
