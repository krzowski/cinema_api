Dry::Validation.load_extensions(:monads)

module MoviePricingCategories
  module Operations
    class CreateCategory
      include Dry::Monads[:result, :do]

      def call(params)
        validator = yield validate(params)
        category = yield persist(validator.to_h)

        Success([:created, category])
      end

      private

      def validate(params)
        Validators::CategoryParams.new.(params).to_monad
      end

      def persist(attributes)
        category = MoviePricingCategory.create!(attributes)
        Success(category)
      end
    end
  end
end
