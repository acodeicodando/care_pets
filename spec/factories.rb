require 'faker'
FactoryBot.define do
  factory :pet do
    name { Faker::Name.name }
    date_of_birth  { rand(10).years.ago }
    pet_type  { 0 }# dog
  end
end