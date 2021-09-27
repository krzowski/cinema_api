FactoryBot.define do
  factory :admin do
    sequence(:email) { |i| "admin#{i}@example.com" }
    password { "password" }
  end
end
