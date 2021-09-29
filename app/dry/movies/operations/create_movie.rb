Dry::Validation.load_extensions(:monads)

module Movies
  module Operations
    class CreateMovie
      include Dry::Monads[:result, :do]

      def call(params)
        validator = yield validate(params)
        movie = yield persist(validator.to_h)
        yield enqueue_omdb_data_fetch(movie)

        Success([:created, movie])
      end

      private

      def validate(params)
        Validators::NewMovieParams.new.(params).to_monad
      end

      def persist(attributes)
        movie = Movie.create!(attributes)
        Success(movie)
      end

      def enqueue_omdb_data_fetch(movie)
        Movies::UpdateOmdbDataJob.perform_later(movie.id)
        Success()
      end
    end
  end
end
