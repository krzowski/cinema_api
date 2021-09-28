require 'rails_helper'

RSpec.describe 'admin_api#movie_showings', type: :request do

  context "POST /admin_api/movie_showings" do
    before do
      @headers = create(:admin).create_new_auth_token
    end

    it "creates a category with valid params" do
      showing = create :movie_showing
      params = {
        movie_pricing_category_id: showing.movie_pricing_category_id,
        movie_id: showing.movie_id,
        show_time: "00:01"
      }
      post "/admin_api/movie_showings", params: { movie_showing: params }, headers: @headers
      expect(response.code).to eq("201")
    end

    it "returns 422 with invalid params" do
      params = {}
      post "/admin_api/movie_showings", params: params, headers: @headers
      expect(response.code).to eq("422")
    end
  end

  context "PATCH /admin_api/movie_showings/:id" do
    before do
      @headers = create(:admin).create_new_auth_token
    end

    it "updates category with valid params" do
      showing = create :movie_showing
      params = {
        movie_pricing_category_id: showing.movie_pricing_category_id,
        movie_id: showing.movie_id,
        show_time: "00:01"
      }
      patch "/admin_api/movie_showings/#{showing.id}", params: { movie_showing: params }, headers: @headers
      expect(response.code).to eq("200")
    end

    it "returns 422 with invalid params" do
      showing = create :movie_showing
      patch "/admin_api/movie_showings/#{showing.id}", params: {}, headers: @headers
      expect(response.code).to eq("422")
    end

    it "returns 404 with invalid id" do
      showing = create :movie_showing
      params = {
        movie_pricing_category_id: showing.movie_pricing_category_id,
        movie_id: showing.movie_id,
        show_time: "00:01"
      }
      patch "/admin_api/movie_showings/12404", params: { movie_showing: params }, headers: @headers
      expect(response.code).to eq("404")
    end
  end
end
