require 'rails_helper'

RSpec.describe MovieShowingSerializer, type: :serializer do
  it "serializes :movie_id, :show_time attributes" do
    serializable_attrs = [:movie_id, :show_time]
    showing = create :movie_showing
    serialized_data = MovieShowingSerializer.new(showing).serializable_hash
    expect(serialized_data[:data][:attributes].keys).to match_array(serializable_attrs)
    expect(serialized_data[:data][:attributes][:show_time]).to eq(showing.show_time.strftime("%H:%M"))
  end
end
