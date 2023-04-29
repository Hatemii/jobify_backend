require 'rails_helper'

RSpec.describe "CompanyUsers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/company_users/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/company_users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/company_users/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/company_users/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/company_users/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /company_user_params" do
    it "returns http success" do
      get "/company_users/company_user_params"
      expect(response).to have_http_status(:success)
    end
  end

end
