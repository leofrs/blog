require 'rails_helper'

RSpec.describe "AlterPasswords", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/alter_password/index"
      expect(response).to have_http_status(:success)
    end
  end

end
