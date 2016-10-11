require 'rails_helper'
require 'faker'

RSpec.describe ItemsController, type: :controller do
  let(:name) { Faker::Lorem.sentence }
  let(:my_user) { User.create(email: Faker::Internet.email, password: Faker::Internet.password) }
  let(:my_item) { Item.create(name: name, user: my_user) }

  describe "POST #create" do
#    it "increases the number of Item by 1" do
#      expect{ post :create, item: {name: name, user: my_user} }.to change(Item,:count).by(1)
#    end

    it "assigns the new item to @item" do
      post :create, item: {name: name, user: my_user}
      expect(assigns(:item)).to eq Item.last
    end

    it "redirects to the user home page" do
      post :create, item: {name: name, user: my_user}
      expect(response).to redirect_to user_session_path
    end
  end
end
