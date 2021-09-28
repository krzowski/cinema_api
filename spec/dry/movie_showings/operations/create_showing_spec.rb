require 'rails_helper'

RSpec.describe MovieShowings::Operations::CreateShowing do
  subject(:operation) { described_class.new }

  it "creates a showing with valid params" do
    movie_pricing_category = create :movie_pricing_category
    movie = create :movie
    initial_categories_count = MovieShowing.count
    params = {
      movie_pricing_category_id: movie_pricing_category.id,
      movie_id: movie.id,
      show_time: "00:01"
    }

    result = operation.call(params)
    expect(result).to be_success
    expect(MovieShowing.count).to eq(initial_categories_count + 1)
  end

  it "fails to create a showing with invalid params" do
    result = operation.call({})
    expect(result).to be_failure
  end
end
