require 'rails_helper'

RSpec.describe NewController, type: :controller do

  describe "GET #genre" do
    it "returns http success" do
      get :genre
      expect(response).to have_http_status(:success)
    end
  end

end
