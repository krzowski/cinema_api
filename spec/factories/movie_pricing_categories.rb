FactoryBot.define do
  factory :movie_pricing_category do
    sequence(:name) { |i| "Category#{i}" }
    price { "10.00" }
  end
end
