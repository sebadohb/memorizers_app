FactoryBot.define do
  factory :user do
    username               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { 'hm19860904' }
    password_confirmation  { 'hm19860904' }
  end
end
