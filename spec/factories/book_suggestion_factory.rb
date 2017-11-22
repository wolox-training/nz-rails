FactoryBot.define do
  factory :book_suggestion do
    editorial {Faker::Fillmurray.image}
    price  {Faker::Commerce.price}
    author {Faker::Book.author}
    title {Faker::Book.title}
    link {Faker::Fillmurray.image}
    publisher {Faker::Book.publisher}
    year {Faker::Number.between(1500, 3000).to_s}
    user_id nil
  end
end
