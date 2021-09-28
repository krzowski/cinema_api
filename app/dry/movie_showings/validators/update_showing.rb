module MovieShowings
  module Validators
    class UpdateShowing < Dry::Validation::Contract
      VALID_TIME_REGEX = /^([01]?[0-9]|2[0-3])\:[0-5][0-9]$/

      params do
        required(:movie_pricing_category_id).filled(:integer)
        required(:movie_id).filled(:integer)
        required(:show_time).filled(:string)
      end

      rule(:movie_pricing_category_id) do
        key.failure("pricing category doesn't exists") unless MoviePricingCategory.where(id: value).exists?
      end

      rule(:movie_id) do
        key.failure("movie doesn't exists") unless Movie.where(id: value).exists?
      end

      rule(:show_time) do
        key.failure("format is incorrect") unless value =~ VALID_TIME_REGEX
      end
    end
  end
end
