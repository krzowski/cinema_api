require 'rails_helper'

RSpec.describe 'Admin sessions', type: :request do

  context "POST /admin_api/auth/sign_in" do
    it "creates admin session with valid credentials" do
      params = attributes_for(:admin)
      Admin.create(params)

      post "/admin_api/auth/sign_in", params: params
      expect(response.code).to eq("200")
    end

    it "returns 401 with invalid credentials" do
      params = attributes_for(:admin)

      post "/admin_api/auth/sign_in", params: params
      expect(response.code).to eq("401")
    end
  end

  context "DELETE /admin_api/auth/sign_out" do
    it "destroys logged admin session" do
      admin = create(:admin)
      headers = admin.create_new_auth_token

      delete('/admin_api/auth/sign_out', headers: headers)
      expect(response.code).to eq("200")
    end

    it "returns 404 for unauthorized user" do
      headers = {
        "access-token"=>"8rbVEAy5KQMnlLUrqD2RcQ",
        "client"=>"FBhXYp5azHK6zpOd3nsNFA",
        "uid"=>"admin2@example.com"
      }

      delete('/admin_api/auth/sign_out', headers: headers)
      expect(response.code).to eq("404")
    end
  end
end
