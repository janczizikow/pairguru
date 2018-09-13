require "rails_helper"

RSpec.describe PagesController, type: :controller do
  describe "GET #comment_leaderboard" do
    it "returns http success" do
      get :comment_leaderboard
      expect(response).to have_http_status(:success)
    end
  end
end
