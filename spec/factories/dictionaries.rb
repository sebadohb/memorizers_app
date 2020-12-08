FactoryBot.define do
  factory :dictionary do
    word           { Faker::Name.name }
    meaning        { "アイウエオ"}
    pronunciation  { "aiueo" }
    definition     { Faker::Lorem.sentence }
    speech_id      { 2 }
    level_id       { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
