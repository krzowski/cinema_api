Dry::Validation.load_extensions(:monads)

module MovieShowings
  module Operations
    class UpdateShowing
      include Dry::Monads[:result, :do]

      def call(id, params)
        validator = yield validate(params)
        showing = yield find_showing(id)
        yield persist(showing, validator.to_h)

        Success([:updated, showing])
      end

      private

      def validate(params)
        Validators::ShowingParams.new.(params).to_monad
      end

      def find_showing(id)
        showing = MovieShowing.find(id)
        Success(showing)
      end

      def persist(showing, attributes)
        showing.update!(attributes)
        Success()
      end
    end
  end
end
