require 'rails_helper'
require 'faker'

RSpec.describe UsersController, type: :controller do
  let(:new_user_attributes) do
    {
      email: Faker::Internet.email,
      password: "blochead",
      password_confirmation: "blochead"
    }
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to redirect_to user_session_path
    end
  end
end
