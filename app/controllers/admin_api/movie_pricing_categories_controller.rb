module AdminApi
  class MoviePricingCategoriesController < BaseController
    def create
      call_action do
        MoviePricingCategories::Operations::CreateCategory.new.call(
          movie_pricing_category_params
        )
      end
    end

    def update
      call_action do
        MoviePricingCategories::Operations::UpdateCategory.new.call(
          params[:id],
          movie_pricing_category_params
        )
      end
    end

    private

    def movie_pricing_category_params
      params.to_unsafe_hash['movie_pricing_category']
    end
  end
end
