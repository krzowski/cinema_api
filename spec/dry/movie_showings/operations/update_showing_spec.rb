require 'rails_helper'

RSpec.describe MovieShowings::Operations::UpdateShowing do
  subject(:operation) { described_class.new }

  it "updates a showing with valid params" do
    showing = create :movie_showing
    update_params = {
      movie_pricing_category_id: showing.movie_pricing_category_id,
      movie_id: showing.movie_id,
      show_time: "00:01"
    }
    result = operation.call(showing.id, update_params)
    expect(result).to be_success
    showing.reload
    expect(showing.show_time.strftime("%H:%M")).to eq(update_params[:show_time])
  end

  it "fails to update showing with invalid params" do
    showing = create :movie_showing
    result = operation.call(showing.id, {})
    expect(result).to be_failure
  end

  it "raises error with invalid id" do
    showing = create :movie_showing
    params = {
      movie_pricing_category_id: showing.movie_pricing_category_id,
      movie_id: showing.movie_id,
      show_time: "00:01"
    }
    expect { operation.call(321, params) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
