Dry::Validation.load_extensions(:monads)

module MoviePricingCategories
  module Operations
    class UpdateCategory
      include Dry::Monads[:result, :do]

      def call(id, params)
        validator = yield validate(params)
        category = yield find_category(id)
        yield persist(category, validator.to_h)

        Success([:updated, category])
      end

      private

      def validate(params)
        update_validator = Validators::UpdateCategory.new.(params)
        update_validator.to_monad
      end

      def find_category(id)
        category = MoviePricingCategory.find(id)
        Success(category)
      end

      def persist(category, attributes)
        category.update!(attributes)
        Success()
      end
    end
  end
end
