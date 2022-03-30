FactoryBot.define do
  factory :recipe do
    title                 {"test_title"}
    process1              {"test_process1"}
    process2              {"test_process2"}
    process3              {"test_process3"}
    # after(:build) do |recipe|
    #   recipe.images.attach(io: File.open('spec/fixtures/test.jpg'), filename: 'test.jpg', content_type: 'image/jpg')
    # end
    trait :image do
      after(:build) do |recipe|
        File.open("#{Rails.root}/spec/fixtures/test.png") do |f|
          recipe.images.attach(io: f, filename: "test.png", content_type: 'image/jpeg')
        end
      end
    end
  end
end
