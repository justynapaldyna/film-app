require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users" do
    it "returns http success" do
      get "/admin/users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /movies" do
    it "returns http success" do
      get "/admin/movies"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show_movie" do
    it "returns http success" do
      get "/admin/show_movie"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show_user" do
    it "returns http success" do
      get "/admin/show_user"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit_user" do
    it "returns http success" do
      get "/admin/edit_user"
      expect(response).to have_http_status(:success)
    end
  end

end
