FactoryBot.define do
  factory :recipe do
    title                 {"test_title"}
    process1              {"test_process1"}
    process2              {"test_process2"}
    process3              {"test_process3"}
    # after(:build) do |recipe|
    #   recipe.images.attach(io: File.open('spec/fixtures/test.png'), filename: 'test.png', content_type: 'image/png')
    # end
  end
end
