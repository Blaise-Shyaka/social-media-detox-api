# Generate the initial User model test data
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { 'foo@bar.com' }
    password { 'foobar' }
  end
end
