require 'rails_helper'

RSpec.describe MovieShowings::Validators::UpdateShowing do
  subject(:validator) { described_class.new }

  it "validates presence of :movie_pricing_category_id, :movie_id, :show_time" do
    result = validator.({})
    expect(result).to be_failure
    expect(result.errors[:movie_pricing_category_id]).to eql(["is missing"])
    expect(result.errors[:movie_id]).to eql(["is missing"])
    expect(result.errors[:show_time]).to eql(["is missing"])
  end

  it "validates presence of movie_pricing_category, movie associations" do
    result = validator.({
      movie_pricing_category_id: "404",
      movie_id: "404",
    })
    expect(result).to be_failure
    expect(result.errors[:movie_pricing_category_id]).to eql(["pricing category doesn't exists"])
    expect(result.errors[:movie_id]).to eql(["movie doesn't exists"])
  end

  it "validates show_time format" do
    result = validator.({show_time: "32:33"})
    expect(result).to be_failure
    expect(result.errors[:show_time]).to eql(["format is incorrect"])
  end

  it "results in success with correct data" do
    showing = create(:movie_showing)
    params = {
      movie_pricing_category_id: showing.movie_pricing_category_id,
      movie_id: showing.movie_id,
      show_time: "00:01"
    }
    result = validator.(params)
    expect(result).to be_success
  end
end
