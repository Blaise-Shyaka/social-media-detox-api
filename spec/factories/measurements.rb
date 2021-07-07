FactoryBot.define do
  factory :measurement do
    twitter { Faker::Company.name }
    instagram { Faker::Company.name }
    tiktok { Faker::Company.name }
    other { Faker::Company.name }
    total_time_spent { Faker::Number.between(from: 0, to: 150) }
    progress {Faker::Number.between(from: 0, to: 100)}
  end
end
