Dry::Validation.load_extensions(:monads)

module MovieShowings
  module Operations
    class CreateShowing
      include Dry::Monads[:result, :do]

      def call(params)
        validator = yield validate(params)
        showing = yield persist(validator.to_h)

        Success([:created, showing])
      end

      private

      def validate(params)
        update_validator = Validators::UpdateShowing.new.(params)
        update_validator.to_monad
      end

      def persist(attributes)
        showing = MovieShowing.create!(attributes)
        Success(showing)
      end
    end
  end
end
