FactoryBot.define do
  factory :user_pet do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    name { Faker::Name.name }
    pet_name { Faker::Creature::Dog.name }
    pet_age { Faker::Number.between(from: 1, to: 20) }
    pet_weight { Faker::Number.between(from: 1.0, to: 20.0) }
  end
end

