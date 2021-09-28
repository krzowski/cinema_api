require 'rails_helper'

RSpec.describe MoviePricingCategories::Operations::CreateCategory do
  subject(:operation) { described_class.new }

  it "creates a category with valid params" do
    initial_categories_count = MoviePricingCategory.count
    result = operation.call(attributes_for(:movie_pricing_category))
    expect(result).to be_success
    expect(MoviePricingCategory.count).to eq(initial_categories_count + 1)
  end

  it "fails to create a category with invalid params" do
    result = operation.call({})
    expect(result).to be_failure
  end
end
