module Movies
  module Validators
    class NewMovie < Dry::Validation::Contract
      params do
        required(:imdb_id).filled(:string)
      end

      rule(:imdb_id) do
        key.failure('already exists') if Movie.where(imdb_id: value).exists?
      end
    end
  end
end
