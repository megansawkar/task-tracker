require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:my_item) { Item.create!(name: "New Item on List.") }

  describe "POST #create" do

    it "assigns the new item to @item" do
      post :create, item: {name: "New Item on List."}
      expect(assigns(:item)).to eq Item.last
    end

    it "redirects to the user home page" do
      post :create, item: {name: "New Item on List."}
      expect(response).to redirect_to user_session_path
    end
  end
end
