require 'rails_helper'

RSpec.describe MoviePricingCategories::Operations::UpdateCategory do
  subject(:operation) { described_class.new }

  it "updates a category with valid params" do
    category = create :movie_pricing_category
    update_params = {
      name: "updated_name",
      price: "300.00"
    }
    result = operation.call(category.id, update_params)
    expect(result).to be_success
    category.reload
    expect(category.name).to eq(update_params[:name])
    expect(category.price).to eq(update_params[:price].to_d)
  end

  it "fails to update category with invalid params" do
    category = create :movie_pricing_category
    result = operation.call(category.id, {})
    expect(result).to be_failure
  end

  it "raises error with invalid id" do
    params = attributes_for :movie_pricing_category
    expect { operation.call(321, params) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
