require 'faker'
40.times do
  Pet.create!(
    name: Faker::Name.first_name,
    date_of_birth: rand(10).years.ago,
    pet_type: [:dog,:cat,:others].sample
  )
end