require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:new_user_attributes) do
    {
      email: "blochead@bloc.io",
      password: "blochead",
      password_confirmation: "blochead"
    }
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
