FactoryBot.define do
  factory :movie_rating do
    association :movie
    association :user
    rating { rand(5) + 1 }
  end
end
