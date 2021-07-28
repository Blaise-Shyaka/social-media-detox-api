FactoryBot.define do
  factory :measurement do
    twitter { Faker::Number.between(from: 0, to: 60) }
    instagram { Faker::Number.between(from: 0, to: 60) }
    tiktok { Faker::Number.between(from: 0, to: 60) }
    other { Faker::Number.between(from: 0, to: 60) }
    total_time_spent { Faker::Number.between(from: 0, to: 10_000) }
    progress { Faker::Number.between(from: 1, to: 100) }
    user_id { User.first.id }
  end
end
