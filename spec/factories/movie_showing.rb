FactoryBot.define do
  factory :movie_showing do
    association :movie
    association :movie_pricing_category
    show_time { "22:00" }
  end
end
