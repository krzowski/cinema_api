require 'rails_helper'

RSpec.describe 'admin_api#movie_pricing_categories', type: :request do

  context "POST /admin_api/movie_pricing_categories" do
    before do
      @headers = create(:admin).create_new_auth_token
    end

    it "creates a category with valid params" do
      params = { movie_pricing_category: attributes_for(:movie_pricing_category) }
      post "/admin_api/movie_pricing_categories", params: params, headers: @headers
      expect(response.code).to eq("201")
    end

    it "returns 422 with invalid params" do
      params = {}
      post "/admin_api/movie_pricing_categories", params: params, headers: @headers
      expect(response.code).to eq("422")
    end
  end

  context "PATCH /admin_api/movie_pricing_categories/:id" do
    before do
      @headers = create(:admin).create_new_auth_token
    end

    it "updates category with valid params" do
      category = create :movie_pricing_category
      params = { movie_pricing_category: attributes_for(:movie_pricing_category) }
      patch "/admin_api/movie_pricing_categories/#{category.id}", params: params, headers: @headers
      expect(response.code).to eq("200")
    end

    it "returns 422 with invalid params" do
      category = create :movie_pricing_category
      params = {}
      patch "/admin_api/movie_pricing_categories/#{category.id}", params: params, headers: @headers
      expect(response.code).to eq("422")
    end

    it "returns 404 with invalid id" do
      params = { movie_pricing_category: attributes_for(:movie_pricing_category) }
      patch "/admin_api/movie_pricing_categories/404", params: params, headers: @headers
      expect(response.code).to eq("404")
    end
  end
end
