require 'rails_helper'
require 'faker'

RSpec.describe ItemsController, type: :controller do
  let(:name) { Faker::Lorem.sentence }
  let(:my_user) { User.create(email: Faker::Internet.email, password: Faker::Internet.password) }
  let(:my_item) { Item.create(name: name, user: my_user) }

context "guest" do
end

context "member user doing CRUD on an item they don't own" do
end

context "member user doing CRUD on a post they own" do
    before do
      @user = my_user
      sign_in @user
    end
  describe "POST #create" do
    it "increases the number of Item by 1" do
      expect{ post :create, user_id: @user.id, item: {name: name} }.to change(Item,:count).by(1)
    end

    it "assigns the new item to @item" do
      post :create, user_id: @user.id, item: {name: name}
      expect(assigns(:item)).to eq Item.last
    end

    it "redirects to the user home page" do
      post :create, user_id: @user.id, item: {name: name}
      expect(response).to redirect_to root_path
    end
  end

  describe "DELETE destroy" do
    it "deletes the item" do
      delete :destroy, user_id: my_user.id, id: my_item.id
      count = Item.where({id: my_item.id}).count
      expect(count).to eq 0
    end

    it "returns http success" do
      delete :destroy, user_id: my_user.id, id: my_item.id
      expect(response).to have_http_status(302)
    end
  end
end 
end
