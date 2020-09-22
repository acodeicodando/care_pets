require 'faker'
FactoryBot.define do
  factory :pet do
    name { Faker::Name.name }
    date_of_birth  { rand(10).years.ago }
    pet_type  { 0 }# dog
  end

  factory :pet_adoption do
    adopted_by { Faker::Name.name }
    adopted_at { rand(10).months.ago }
    pet { association(:pet) }
  end
end