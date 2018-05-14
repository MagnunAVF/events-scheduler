FactoryBot.define do
  factory :user do
    name      Faker::LordOfTheRings.character
    email     Faker::Internet.free_email
  end
end
