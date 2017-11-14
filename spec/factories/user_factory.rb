FactoryBot.define do
  factory :user do
    first_name 'test'
    last_name  'test'
    password '123123123'
    password_confirmation '123123123'
    email 'test@email'
    locale 'en'
  end
end
