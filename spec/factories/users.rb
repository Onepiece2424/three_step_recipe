FactoryBot.define do
  factory :user do
    username              {"test_username"}
    email                 {"test@gmail.com"}
    password              {"12345678"}
    password_confirmation {"12345678"}
    # recipe
  end
end
