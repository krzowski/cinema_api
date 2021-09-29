module MovieRatings
  module Validators
    class RatingParams < Dry::Validation::Contract
      params do
        required(:user_id).filled(:integer)
        required(:movie_id).filled(:integer)
        required(:rating).filled(:integer)
      end

      rule(:user_id) do
        key.failure("user doesn't exists") unless User.where(id: value).exists?
      end

      rule(:movie_id) do
        key.failure("movie doesn't exists") unless Movie.where(id: value).exists?
      end

      rule(:movie_id) do
        if MovieRating.where(user_id: values[:user_id], movie_id: values[:movie_id]).exists?
          key.failure("already rated")
        end
      end

      rule(:rating) do
        key.failure("is out of range") unless value.in?(1..5)
      end
    end
  end
end
