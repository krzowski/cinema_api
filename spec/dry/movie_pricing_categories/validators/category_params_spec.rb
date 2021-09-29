require 'rails_helper'

RSpec.describe MoviePricingCategories::Validators::CategoryParams do
  subject(:validator) { described_class.new }

  it "validates presence of :name, :price" do
    result = validator.({})
    expect(result).to be_failure
    expect(result.errors[:name]).to eql(["is missing"])
    expect(result.errors[:price]).to eql(["is missing"])
  end

  it "results in success with correct data" do
    params = attributes_for(:movie_pricing_category)
    result = validator.(params)
    expect(result).to be_success
    expect(result.to_h).to eq({
      name: params[:name],
      price: params[:price].to_d
    })
  end
end
