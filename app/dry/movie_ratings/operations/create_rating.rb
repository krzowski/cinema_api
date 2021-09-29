Dry::Validation.load_extensions(:monads)

module MovieRatings
  module Operations
    class CreateRating
      include Dry::Monads[:result, :do]

      def call(params)
        validator = yield validate(params)
        rating = yield persist(validator.to_h)

        Success([:created, rating])
      end

      private

      def validate(params)
        Validators::RatingParams.new.(params).to_monad
      end

      def persist(attributes)
        rating = MovieRating.create!(attributes)
        Success(rating)
      end
    end
  end
end
