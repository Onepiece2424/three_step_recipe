FactoryBot.define do
  factory :recipe do
    title                 {"test_title"}
    process1              {"test_process1"}
    process2              {"test_process2"}
    process3              {"test_process3"}
    user
    # image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png'))}
    # after(:build) do |recipe|
    #   recipe.images.attach(io: File.open('spec/fixtures/test.png'), filename: 'test.png', content_type: 'image/png')
    # end
    # trait :image do
    #   after(:build) do |recipe|
    #     File.open("#{Rails.root}/spec/fixtures/test.png") do |f|
    #       recipe.images.attach(io: f, filename: "test.png", content_type: 'image/jpeg')
    #     end
    #   end
    # end
    # after(:build) do |recipe|
    #   recipe.images << build(:image, recipe: recipe)
    # end
  end
end
