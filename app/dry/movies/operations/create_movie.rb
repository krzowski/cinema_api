Dry::Validation.load_extensions(:monads)

module Movies
  module Operations
    class CreateMovie
      include Dry::Monads[:result, :do]

      def call(params)
        validator = yield validate(params)
        movie = yield persist(validator.to_h)

        Success([:created, movie])
      end

      private

      def validate(params)
        new_movie_validator = Validators::NewMovie.new.(params)
        new_movie_validator.to_monad
      end

      def persist(attributes)
        movie = Movie.create!(attributes)
        Success(movie)
      end
    end
  end
end
