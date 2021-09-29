module MoviePricingCategories
  module Validators
    class CategoryParams < Dry::Validation::Contract
      params do
        required(:name).filled(:string)
        required(:price).filled(:decimal)
      end
    end
  end
end
