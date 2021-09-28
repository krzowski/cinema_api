require 'rails_helper'

RSpec.describe 'admin_api#movies', type: :request do

  context "POST /admin_api/movies" do
    before do
      @headers = create(:admin).create_new_auth_token
    end

    it "creates movie with valid params" do
      params = { movie: attributes_for(:movie) }
      post "/admin_api/movies", params: params, headers: @headers
      expect(response.code).to eq("201")
    end

    it "returns 401 with invalid params" do
      params = {}
      post "/admin_api/movies", params: params, headers: @headers
      expect(response.code).to eq("422")
    end
  end
end
